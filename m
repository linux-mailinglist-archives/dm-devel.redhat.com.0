Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id E6956133D03
	for <lists+dm-devel@lfdr.de>; Wed,  8 Jan 2020 09:22:13 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1578471732;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=Wl12ogLJrHNEErGXhpmexWp6wrS54qo2W+9qPs/a+sw=;
	b=DDV3BiRPRNG0g2OpvdllyZSj+ep8erMCPeICvPKr4DBlQfNaccE06KfAGSRT03MYfCt3BS
	wao6GpnvCSER18IUebh1QmkNT0wYKBarRCMnfmKU0lb1oDKdDo2Uo5cVra1v9MEPDeLvF+
	UCxCHG/oaxA5Vt1TLD24m52S80l1gNc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-297-BhtnxfWiM62kB2ydC2DGZQ-1; Wed, 08 Jan 2020 03:22:10 -0500
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 716D418C35A7;
	Wed,  8 Jan 2020 08:22:03 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 65E5C60CC0;
	Wed,  8 Jan 2020 08:22:01 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 127C5820EE;
	Wed,  8 Jan 2020 08:21:56 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 007IFX2O016148 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 7 Jan 2020 13:15:33 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 874CF100D74; Tue,  7 Jan 2020 18:15:33 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 80040F4994
	for <dm-devel@redhat.com>; Tue,  7 Jan 2020 18:15:31 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 68F978007DC
	for <dm-devel@redhat.com>; Tue,  7 Jan 2020 18:15:31 +0000 (UTC)
IronPort-SDR: 6NqzSdyPZEDLBekS4PclRh/hvz7Yn5TRJ9wx2TvAoohFquK5SK/fFi+2EoXrGWcq0hzL1IU28F
	vpgp/qSezSGp8ayjOJYlDwNFSEd5T1Qj8B+81mK1IXYWrPlT06oFyip1tiDBD6Yy+oQkVtdePZ
	m3W6vCd/6c/uYhAgzlBj/BYUFhBZeEiQ3/Lto+lHF9IH2Yo3BjwCjyXIywz1efaTO8SNmYrmUU
	kpSlXQ8VjdOXaNSZBiwQBycJ4+sXqQFSQ42gH+rI+8LWaw2jLf6T94VBDmf9O8MfAAlpI4HjrK
	kA4=
X-IronPort-AV: E=Sophos;i="5.69,406,1571673600"; d="scan'208";a="234671188"
Received: from esa1.hgst.iphmx.com (esa1.hgst.iphmx.com [68.232.141.245])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-103-EVz5OqlFPIewss3NFLkYPA-1; Tue, 07 Jan 2020 13:15:27 -0500
Received: from mail-bl2nam02lp2056.outbound.protection.outlook.com (HELO
	NAM02-BL2-obe.outbound.protection.outlook.com) ([104.47.38.56])
	by ob1.hgst.iphmx.com with ESMTP; 08 Jan 2020 02:14:18 +0800
Received: from BYAPR04MB5749.namprd04.prod.outlook.com (20.179.57.21) by
	BYAPR04MB4470.namprd04.prod.outlook.com (52.135.237.79) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.2602.15; Tue, 7 Jan 2020 18:14:17 +0000
Received: from BYAPR04MB5749.namprd04.prod.outlook.com
	([fe80::a8ea:4ba9:cb57:e90f]) by
	BYAPR04MB5749.namprd04.prod.outlook.com
	([fe80::a8ea:4ba9:cb57:e90f%5]) with mapi id 15.20.2602.016;
	Tue, 7 Jan 2020 18:14:17 +0000
From: Chaitanya Kulkarni <Chaitanya.Kulkarni@wdc.com>
To: "linux-block@vger.kernel.org" <linux-block@vger.kernel.org>,
	"linux-scsi@vger.kernel.org" <linux-scsi@vger.kernel.org>,
	"linux-nvme@lists.infradead.org" <linux-nvme@lists.infradead.org>,
	"dm-devel@redhat.com" <dm-devel@redhat.com>,
	"lsf-pc@lists.linux-foundation.org" <lsf-pc@lists.linux-foundation.org>
Thread-Topic: [LSF/MM/BFP ATTEND] [LSF/MM/BFP TOPIC] Storage: Copy Offload
Thread-Index: AQHVxYZFlOEpmvYia0KWnm3aEM0giQ==
Date: Tue, 7 Jan 2020 18:14:17 +0000
Message-ID: <BYAPR04MB5749820C322B40C7DBBBCA02863F0@BYAPR04MB5749.namprd04.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [199.255.45.62]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: e26e0278-6748-4345-c3ec-08d7939d6903
x-ms-traffictypediagnostic: BYAPR04MB4470:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BYAPR04MB4470E21158188BE326CB46FE863F0@BYAPR04MB4470.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 027578BB13
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(4636009)(376002)(346002)(396003)(39860400002)(136003)(366004)(189003)(199004)(53754006)(33656002)(2906002)(4326008)(478600001)(55016002)(9686003)(186003)(66476007)(7696005)(66446008)(66946007)(66556008)(6506007)(76116006)(64756008)(54906003)(316002)(110136005)(26005)(8676002)(66574012)(8936002)(81156014)(71200400001)(7416002)(81166006)(966005)(5660300002)(86362001)(52536014)(15398625002);
	DIR:OUT; SFP:1102; SCL:1; SRVR:BYAPR04MB4470;
	H:BYAPR04MB5749.namprd04.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; MX:1; A:1;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: kDiD37JNy1JZmPtUS/37Sot6KGO73Hr4rc05OR1VzDSubpJwBFTBrLy2vPoeuGAMUDb4oy5pRobKRBOlvIJHO3PDlOIaUwFDwBRNDwx6E0rHT77ih8YhfWSca8Ew3nJTXYnRtK2HCwvL8uucm4+J9kOYyPtrNZM8e/yHIDa+91/8cA3n2zKOWAKEzoVydKcOFy+C+d2McSr5/Vb7EG7fpwg0Zf4tggfjt0NAoZ2S75ZmPYrhVNnFs2sWnu8e3Dzn6Xjb8vHKwkQ78uEg4mnajXZ8DaDq9kqf3T6sx7H4muj+ig1W/2ObezykOBLiMCW22m9oYGQl4Cwq+QqsdX3GqBi62qzuW7z6iW1ri8ZlfEN6CslbzPwJ11T6GI44O3M3IxNg6JTwd4V6uxskDZiK5UFra0oPZXZK5Xzdp9bTpnBBqkI4XDjMoe2/uKqB/fRbfk2KPJb4L6AfrkuqJH5geTlZphIyKCyN9CoaxrhFtdYYxe6Q1rDArZ49Mh/1O6twzdsCNl1D3CYPR311WIJF6nPdXpFWRTg1XsOe1YmojErl1R9aq7dzI0uqlsuInACjt6upEoY3J1kWn4Y7WbpUNVmbmALqJdbqzHuQai2FUlE=
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e26e0278-6748-4345-c3ec-08d7939d6903
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Jan 2020 18:14:17.5528 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: uV11/h+HQVGH+b5DmUGntMKLo6BW2Q3YISL02PtEEeMRyp5pY6axhwkDnCH4dH8iJ4f4lPAG5T0mZXteMpMAYj8MU3qAbjzdfNp/Y0hhgoE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR04MB4470
X-MC-Unique: EVz5OqlFPIewss3NFLkYPA-1
X-MC-Unique: BhtnxfWiM62kB2ydC2DGZQ-1
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 007IFX2O016148
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Wed, 08 Jan 2020 03:21:49 -0500
Cc: "axboe@kernel.dk" <axboe@kernel.dk>,
	"msnitzer@redhat.com" <msnitzer@redhat.com>,
	"bvanassche@acm.org" <bvanassche@acm.org>,
	"Martin K. Petersen" <martin.petersen@oracle.com>, Christoph,
	Matias Bjorling <Matias.Bjorling@wdc.com>,
	Stephen Bates <sbates@raithlin.com>,
	"roland@purestorage.com" <roland@purestorage.com>,
	"mpatocka@redhat.com" <mpatocka@redhat.com>,
	Keith Busch <kbusch@kernel.org>,
	"rwheeler@redhat.com" <rwheeler@redhat.com>, Hellwig <hch@lst.de>,
	"frederick.knight@netapp.com" <frederick.knight@netapp.com>,
	"zach.brown@ni.com" <zach.brown@ni.com>
Subject: [dm-devel] [LSF/MM/BFP ATTEND] [LSF/MM/BFP TOPIC] Storage: Copy
	Offload
X-BeenThere: dm-devel@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: device-mapper development <dm-devel.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/dm-devel>,
	<mailto:dm-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/dm-devel>
List-Post: <mailto:dm-devel@redhat.com>
List-Help: <mailto:dm-devel-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/dm-devel>,
	<mailto:dm-devel-request@redhat.com?subject=subscribe>
Sender: dm-devel-bounces@redhat.com
Errors-To: dm-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi all,

* Background :-
-----------------------------------------------------------------------

Copy offload is a feature that allows file-systems or storage devices
to be instructed to copy files/logical blocks without requiring
involvement of the local CPU.

With reference to the RISC-V summit keynote [1] single threaded
performance is limiting due to Denard scaling and multi-threaded
performance is slowing down due Moore's law limitations. With the rise
of SNIA Computation Technical Storage Working Group (TWG) [2],
offloading computations to the device or over the fabrics is becoming
popular as there are several solutions available [2]. One of the common
operation which is popular in the kernel and is not merged yet is Copy
offload over the fabrics or on to the device.

* Problem :-
-----------------------------------------------------------------------

The original work which is done by Martin is present here [3]. The
latest work which is posted by Mikulas [4] is not merged yet. These two
approaches are totally different from each other. Several storage
vendors discourage mixing copy offload requests with regular READ/WRITE
I/O. Also, the fact that the operation fails if a copy request ever
needs to be split as it traverses the stack it has the unfortunate
side-effect of preventing copy offload from working in pretty much
every common deployment configuration out there.

* Current state of the work :-
-----------------------------------------------------------------------

With [3] being hard to handle arbitrary DM/MD stacking without
splitting the command in two, one for copying IN and one for copying
OUT. Which is then demonstrated by the [4] why [3] it is not a suitable
candidate. Also, with [4] there is an unresolved problem with the
two-command approach about how to handle changes to the DM layout
between an IN and OUT operations.

* Why Linux Kernel Storage System needs Copy Offload support now ?
-----------------------------------------------------------------------

With the rise of the SNIA Computational Storage TWG and solutions [2],
existing SCSI XCopy support in the protocol, recent advancement in the
Linux Kernel File System for Zoned devices (Zonefs [5]), Peer to Peer
DMA support in the Linux Kernel mainly for NVMe devices [7] and
eventually NVMe Devices and subsystem (NVMe PCIe/NVMeOF) will benefit
from Copy offload operation.

With this background we have significant number of use-cases which are
strong candidates waiting for outstanding Linux Kernel Block Layer Copy
Offload support, so that Linux Kernel Storage subsystem can to address
previously mentioned problems [1] and allow efficient offloading of the
data related operations. (Such as move/copy etc.)

For reference following is the list of the use-cases/candidates waiting
for Copy Offload support :-

1. SCSI-attached storage arrays.
2. Stacking drivers supporting XCopy DM/MD.
3. Computational Storage solutions.
7. File systems :- Local, NFS and Zonefs.
4. Block devices :- Distributed, local, and Zoned devices.
5. Peer to Peer DMA support solutions.
6. Potentially NVMe subsystem both NVMe PCIe and NVMeOF.

* What we will discuss in the proposed session ?
-----------------------------------------------------------------------

I'd like to propose a session to go over this topic to understand :-

1. What are the blockers for Copy Offload implementation ?
2. Discussion about having a file system interface.
3. Discussion about having right system call for user-space.
4. What is the right way to move this work forward ?
5. How can we help to contribute and move this work forward ?

* Required Participants :-
-----------------------------------------------------------------------

I'd like to invite block layer, device drivers and file system
developers to:-

1. Share their opinion on the topic.
2. Share their experience and any other issues with [4].
3. Uncover additional details that are missing from this proposal.

Required attendees :-

Martin K. Petersen
Jens Axboe
Christoph Hellwig
Bart Van Assche
Stephen Bates
Zach Brown
Roland Dreier
Ric Wheeler
Trond Myklebust
Mike Snitzer
Keith Busch
Sagi Grimberg
Hannes Reinecke
Frederick Knight
Mikulas Patocka
Matias Bj=F8rling

[1]https://content.riscv.org/wp-content/uploads/2018/12/A-New-Golden-Age-fo=
r-Computer-Architecture-History-Challenges-and-Opportunities-David-Patterso=
n-.pdf
[2] https://www.snia.org/computational
https://www.napatech.com/support/resources/solution-descriptions/napatech-s=
martnic-solution-for-hardware-offload/
      https://www.eideticom.com/products.html
https://www.xilinx.com/applications/data-center/computational-storage.html
[3] git://git.kernel.org/pub/scm/linux/kernel/git/mkp/linux.git xcopy
[4] https://www.spinics.net/lists/linux-block/msg00599.html
[5] https://lwn.net/Articles/793585/
[6] https://nvmexpress.org/new-nvmetm-specification-defines-zoned-
namespaces-zns-as-go-to-industry-technology/
[7] https://github.com/sbates130272/linux-p2pmem
[8] https://kernel.dk/io_uring.pdf

Regards,
Chaitanya



--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

