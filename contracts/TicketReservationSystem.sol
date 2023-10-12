 // SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;
import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "contracts/token20.sol";

contract nftToken is ERC721 {
    constructor(uint initialSupply) ERC721("shiningstar", "star") {}

    function mint(address to, uint tokenId) public {
        _mint(to, tokenId);
    }
}

contract TicketReservationSystem{
    nftToken tokenNft;
    address owner;
    token token20;
    uint public _Ticketprice;
    string public _time;
    uint8 FirstClassTicketNo = 1;
    uint BusinessClassTicketNo = 11;
    uint PremiumEconomyTicketNo = 21;
    uint EconomyTicketNo = 31;

    struct Ticket {
        string name;
        string source;
        string destination;
        string date;
        string cabin_class;
        bool booked;
        uint ticketNumber;
    }

    Ticket[] ticketBooked;

    mapping(address => bool) public hasPurchasedTicket;

    event Purchased(uint ticketNo, address passenger);
    event price_time(uint _Ticketprice, string _time);

     modifier onlyOwner() {
        require(msg.sender == owner, "Only the owner can call this function");
        _;
    }

    constructor(address _NFTtoken, address _token20) {
        tokenNft = nftToken(_NFTtoken);
        token20 = token(_token20);
        owner = msg.sender;
        for (uint i = 1; i <= 50; i++) {
            tokenNft.mint(address(this), i);
        }
    }

    function flight_detail() public pure returns (string memory, string memory, string memory) {
        return (
            "From Karachi to Islamabad  : Economy Ticket price is 120",
            "From Lahore to Karachi     : Economy Ticket price is 100",
            "From Multan to Karachi   : Economy Ticket price is 200"
        );
    }

    function Cabin_Class() public pure returns (string memory, string memory, string memory, string memory) {
        return (
            "Economy",
            "Premium_Economy  :you have to pay 5% extra charges than Economy class charge",
            "Business_Class  :you have to pay 10% extra charges than Economy class charge",
            "First_Class    :you have to pay 15% extra charges than Economy class charge"
        );
    }

    function detailtoBook(string memory _cabin_class, string memory _source, string memory _destination, string memory _date) public returns (uint, string memory) {
        uint Ticketprice;
        Ticketprice = _Ticketprice;
        string memory time;
        time = _time;
           
    if (keccak256(abi.encodePacked(_cabin_class))==keccak256(abi.encodePacked("Economy"))) {
        if (keccak256(abi.encodePacked(_source))==keccak256(abi.encodePacked("Karachi"))) {
            if (keccak256(abi.encodePacked(_destination))==keccak256(abi.encodePacked("Islamabad"))) {
                if (keccak256(abi.encodePacked(_date))==keccak256(abi.encodePacked("20-sep-2023"))) {
                       _Ticketprice = 120;
                       _time = "2pm";


                }
            }
        }
    } else if (keccak256(abi.encodePacked(_cabin_class))==keccak256(abi.encodePacked("Premium Economy"))) {
               if (keccak256(abi.encodePacked(_source))==keccak256(abi.encodePacked("Karachi"))) {
                   if (keccak256(abi.encodePacked(_destination))==keccak256(abi.encodePacked("Islamabad"))) {
                       if (keccak256(abi.encodePacked(_date))==keccak256(abi.encodePacked("20-sep-2023"))) {
                              _Ticketprice=120+((120*5)/100);
                              _time="2pm";
                }
            }
        }
    } else if (keccak256(abi.encodePacked(_cabin_class))==keccak256(abi.encodePacked("Business Class"))) {
               if (keccak256(abi.encodePacked(_source))==keccak256(abi.encodePacked("Karachi"))) {
                   if (keccak256(abi.encodePacked(_destination))==keccak256(abi.encodePacked("Islamabad"))) {
                       if (keccak256(abi.encodePacked(_date))==keccak256(abi.encodePacked("20-sep-2023"))) {
                              _Ticketprice=120+((120*10)/100);
                              _time="2pm";
                }
            }
        }
    } else if (keccak256(abi.encodePacked(_cabin_class))==keccak256(abi.encodePacked("First Class"))) {
              if (keccak256(abi.encodePacked(_source))==keccak256(abi.encodePacked("Karachi"))) {
                 if (keccak256(abi.encodePacked(_destination))==keccak256(abi.encodePacked("Islamabad"))) {
                    if (keccak256(abi.encodePacked(_date))==keccak256(abi.encodePacked("20-sep-2023"))) {
                           _Ticketprice=120+((120*15)/100);
                           _time="2pm";
                }
            }
        }
    }  if (keccak256(abi.encodePacked(_cabin_class))==keccak256(abi.encodePacked("Economy"))) {
               if (keccak256(abi.encodePacked(_source))==keccak256(abi.encodePacked("Lahore"))) {
                  if (keccak256(abi.encodePacked(_destination))==keccak256(abi.encodePacked("Karachi"))) {
                     if (keccak256(abi.encodePacked(_date))==keccak256(abi.encodePacked("20-sep-2023"))) {
                            _Ticketprice = 100;
                             _time = "6pm";
                }
            }
        }
    } else if (keccak256(abi.encodePacked(_cabin_class))==keccak256(abi.encodePacked("Premium Economy"))) {
               if (keccak256(abi.encodePacked(_source))==keccak256(abi.encodePacked("Lahore"))) {
                   if (keccak256(abi.encodePacked(_destination))==keccak256(abi.encodePacked("Karachi"))) {
                       if (keccak256(abi.encodePacked(_date))==keccak256(abi.encodePacked("20-sep-2023"))) { 
                              _Ticketprice=100+((100*5)/100);
                              _time="6pm";
                }
            }
        }
    }else if (keccak256(abi.encodePacked(_cabin_class))==keccak256(abi.encodePacked("Business Class"))) {
               if (keccak256(abi.encodePacked(_source))==keccak256(abi.encodePacked("Lahore"))) {
                   if (keccak256(abi.encodePacked(_destination))==keccak256(abi.encodePacked("Karachi"))) {
                       if (keccak256(abi.encodePacked(_date))==keccak256(abi.encodePacked("20-sep-2023"))) { 
                              _Ticketprice=100+((100*10)/100);
                              _time="6pm";
                }    
            }
        }
    } else if (keccak256(abi.encodePacked(_cabin_class))==keccak256(abi.encodePacked("First Class"))) {
               if (keccak256(abi.encodePacked(_source))==keccak256(abi.encodePacked("Lahore"))) {
                   if (keccak256(abi.encodePacked(_destination))==keccak256(abi.encodePacked("Karachi"))) {
                       if (keccak256(abi.encodePacked(_date))==keccak256(abi.encodePacked("20-sep-2023"))) {
                            _Ticketprice=100+((100*15)/100);
                                   _time="6pm";
                }
            }
        }
    }  if (keccak256(abi.encodePacked(_cabin_class))==keccak256(abi.encodePacked("Economy"))) {
               if (keccak256(abi.encodePacked(_source))==keccak256(abi.encodePacked("Multan"))) {
                   if (keccak256(abi.encodePacked(_destination))==keccak256(abi.encodePacked("Karachi"))) {
                       if (keccak256(abi.encodePacked(_date))==keccak256(abi.encodePacked("20-sep-2023"))) {
                               _Ticketprice = 200;
                               _time = "2am";
                }
            }
        }
    } else if (keccak256(abi.encodePacked(_cabin_class))==keccak256(abi.encodePacked("Premium Economy"))) {
               if (keccak256(abi.encodePacked(_source))==keccak256(abi.encodePacked("Multan"))) {
                   if (keccak256(abi.encodePacked(_destination))==keccak256(abi.encodePacked("Karachi"))) {
                       if (keccak256(abi.encodePacked(_date))==keccak256(abi.encodePacked("20-sep-2023"))) {
                               _Ticketprice=200+((200*5)/100);
                               _time="2am";
                }
            }
        }
    } else if (keccak256(abi.encodePacked(_cabin_class))==keccak256(abi.encodePacked("Business Class"))) {
               if (keccak256(abi.encodePacked(_source))==keccak256(abi.encodePacked("Multan"))) {
                   if (keccak256(abi.encodePacked(_destination))==keccak256(abi.encodePacked("Karachi"))) {
                       if (keccak256(abi.encodePacked(_date))==keccak256(abi.encodePacked("20-sep-2023"))) {
                               _Ticketprice=200+((200*10)/100);
                               _time="2am";
                }
                                     
            }
        }
    } else if (keccak256(abi.encodePacked(_cabin_class))==keccak256(abi.encodePacked("First Class"))) {
               if (keccak256(abi.encodePacked(_source))==keccak256(abi.encodePacked("Multan"))) {
                   if (keccak256(abi.encodePacked(_destination))==keccak256(abi.encodePacked("Karachi"))) {
                       if (keccak256(abi.encodePacked(_date))==keccak256(abi.encodePacked("20-sep-2023"))) {
                              _Ticketprice=200+((200*15)/100);
                              _time="2am";
                }
            }
        }
    } else {
                    revert(" category not found");
    }

        emit price_time(_Ticketprice, _time);

        return (Ticketprice, time);
    }

    function purchaseTicket(
        string memory _name,
        string memory _source,
        string memory _destination,
        string memory _date,
        string memory _cabin_class,
        bool _isRoundTrip
    ) public returns (uint) {
        require(msg.sender != address(0), "Invalid sender address");

        // Add the ticket data to the ticketBooked array
        uint ticketNumber;
        if (keccak256(abi.encodePacked(_cabin_class)) == keccak256(abi.encodePacked("First Class"))) {
            require(FirstClassTicketNo <= 10, "No more first Class tickets available");
            ticketBooked.push(Ticket(_name, _source, _destination, _date, _cabin_class, true, FirstClassTicketNo));
            if (_isRoundTrip==true) {
                _Ticketprice = _Ticketprice * 2; // Double the price for round-trip
            } else {
                _Ticketprice = _Ticketprice; // Use regular price for one-way
            }
            token20.transferFrom(msg.sender, address(this), _Ticketprice);
            tokenNft.transferFrom(address(this), msg.sender, FirstClassTicketNo);
            emit Purchased(FirstClassTicketNo, msg.sender);
            ticketNumber = FirstClassTicketNo;
            FirstClassTicketNo++;
        } else if (keccak256(abi.encodePacked(_cabin_class)) == keccak256(abi.encodePacked("Business Class"))) {
            require(BusinessClassTicketNo <= 20, "No more Business tickets available");
            ticketBooked.push(Ticket(_name, _source, _destination, _date, _cabin_class, true, BusinessClassTicketNo));
             if (_isRoundTrip==true) {
                _Ticketprice = _Ticketprice * 2; // Double the price for round-trip
            } else {
                _Ticketprice = _Ticketprice; // Use regular price for one-way
            }
            token20.transferFrom(msg.sender, address(this), _Ticketprice);
            tokenNft.transferFrom(address(this), msg.sender, BusinessClassTicketNo);
            emit Purchased(BusinessClassTicketNo, msg.sender);
            ticketNumber = BusinessClassTicketNo;
            BusinessClassTicketNo++;
        } else if (keccak256(abi.encodePacked(_cabin_class)) == keccak256(abi.encodePacked("Premium Economy"))) {
            require(PremiumEconomyTicketNo <= 30, "No more premium Economy tickets available");
            ticketBooked.push(Ticket(_name, _source, _destination, _date, _cabin_class, true, PremiumEconomyTicketNo));
            if (_isRoundTrip==true) {
                _Ticketprice = _Ticketprice * 2; // Double the price for round-trip
            } else {
                _Ticketprice = _Ticketprice; // Use regular price for one-way
            }
            token20.transferFrom(msg.sender, address(this), _Ticketprice);
            tokenNft.transferFrom(address(this), msg.sender, PremiumEconomyTicketNo);
            emit Purchased(PremiumEconomyTicketNo, msg.sender);
            ticketNumber = PremiumEconomyTicketNo;
            PremiumEconomyTicketNo++;
        } else if (keccak256(abi.encodePacked(_cabin_class)) == keccak256(abi.encodePacked("Economy"))) {
            require(EconomyTicketNo <= 50, "No more Economy tickets available");
            ticketBooked.push(Ticket(_name, _source, _destination, _date, _cabin_class, true, EconomyTicketNo));
             if (_isRoundTrip==true) {
                _Ticketprice = _Ticketprice * 2; // Double the price for round-trip
            } else {
                _Ticketprice = _Ticketprice; // Use regular price for one-way
            }
            token20.transferFrom(msg.sender, address(this), _Ticketprice);
            tokenNft.transferFrom(address(this), msg.sender, EconomyTicketNo);
            emit Purchased(EconomyTicketNo, msg.sender);
            ticketNumber = EconomyTicketNo;
            EconomyTicketNo++;
        } else {
            revert("All seats are booked");
        }

        hasPurchasedTicket[msg.sender] = true;

        return ticketNumber;
    }

    function getTicketDataCount() public view returns (uint) {
        return ticketBooked.length;
    }

    function getTicketData(uint index) public view  onlyOwner returns (string memory, string memory, string memory, string memory, string memory, bool, uint) {
        require(index < ticketBooked.length, "Invalid index");
        Ticket memory data = ticketBooked[index];
        return (data.name, data.source, data.destination, data.date, data.cabin_class, data.booked, data.ticketNumber);
    }

    function ticketPrice(uint price) public onlyOwner {
        _Ticketprice = price;
    }

    function withdrawTokens(address to, uint amount) public onlyOwner {
        token20.transfer(to, amount);
    }
}
