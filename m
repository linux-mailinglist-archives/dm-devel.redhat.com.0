Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 233C51354E5
	for <lists+dm-devel@lfdr.de>; Thu,  9 Jan 2020 09:56:57 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1578560215;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=N5Kkd2hNL0ArJMvzHIgdYq92hfBC0Vguj7bqmOPofjs=;
	b=BMEx1QLJZBZEj4f6TxV2M0em5BPhc17wEJJEAebhzZOKARrpRrZePxwSUbDZw8iNrjpcgB
	35M/ukLEo0lZwrp28E9nzDllJwyG6J1SXEykoXZOqyP/K4yoVgp152BAgfxBfoD9kPWT0p
	85TjrPTF1ynJlCH2vVrUa0867hVOHjQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-173-64HUbJNBPEaXkxxskts9qQ-1; Thu, 09 Jan 2020 03:56:51 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B6FAF801E7A;
	Thu,  9 Jan 2020 08:56:45 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8A465858AB;
	Thu,  9 Jan 2020 08:56:45 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 2411D503BA;
	Thu,  9 Jan 2020 08:56:45 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 00941jjD030056 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 8 Jan 2020 23:01:45 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 3BFA82166B27; Thu,  9 Jan 2020 04:01:45 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 355C72166B28
	for <dm-devel@redhat.com>; Thu,  9 Jan 2020 04:01:42 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A954E10192AC
	for <dm-devel@redhat.com>; Thu,  9 Jan 2020 04:01:42 +0000 (UTC)
IronPort-SDR: iMr6RgvTl9G/66pnBlS7mvHFD+O+vf2JfDLxxn+8xRAF17aPhWChYe+vuvJfCa6BDjn7g5jP8c
	uO0/s9FXp9oKtUocpYx+/WI62gxpb6u6uAJmU5gEf276m4OQcqPvzdoRfzWJWHyCdnVNrZPXoM
	eyJEUDid8CbfxaW3mJ5cpYQ1NzZZeo6SMFQpsDl/RN18VGpq8MvcY+QNiWdjQVO3vfXJVHM9lf
	KQ64PHrui6z6Zlv6Y5aSd0flAdjPDMqbzSJTeApBJtl7abY/5bEXCJsEQqXfxivETw9TXMEqkU
	6wc=
X-IronPort-AV: E=Sophos;i="5.69,412,1571673600"; d="scan'208";a="127742675"
Received: from esa5.hgst.iphmx.com (esa5.hgst.iphmx.com [216.71.153.144])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-125-qTLKB3mxMSm4d2Jjh7qMsA-1; Wed, 08 Jan 2020 23:01:39 -0500
Received: from mail-bn8nam11lp2174.outbound.protection.outlook.com (HELO
	NAM11-BN8-obe.outbound.protection.outlook.com) ([104.47.58.174])
	by ob1.hgst.iphmx.com with ESMTP; 09 Jan 2020 12:01:32 +0800
Received: from BYAPR04MB5749.namprd04.prod.outlook.com (20.179.57.21) by
	BYAPR04MB4919.namprd04.prod.outlook.com (52.135.235.139) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.2602.12; Thu, 9 Jan 2020 04:01:31 +0000
Received: from BYAPR04MB5749.namprd04.prod.outlook.com
	([fe80::a8ea:4ba9:cb57:e90f]) by
	BYAPR04MB5749.namprd04.prod.outlook.com
	([fe80::a8ea:4ba9:cb57:e90f%5]) with mapi id 15.20.2602.016;
	Thu, 9 Jan 2020 04:01:31 +0000
From: Chaitanya Kulkarni <Chaitanya.Kulkarni@wdc.com>
To: Bart Van Assche <bvanassche@acm.org>, "linux-block@vger.kernel.org"
	<linux-block@vger.kernel.org>, "linux-scsi@vger.kernel.org"
	<linux-scsi@vger.kernel.org>, "linux-nvme@lists.infradead.org"
	<linux-nvme@lists.infradead.org>, "dm-devel@redhat.com"
	<dm-devel@redhat.com>, "lsf-pc@lists.linux-foundation.org"
	<lsf-pc@lists.linux-foundation.org>
Thread-Topic: [LSF/MM/BFP ATTEND] [LSF/MM/BFP TOPIC] Storage: Copy Offload
Thread-Index: AQHVxYZFlOEpmvYia0KWnm3aEM0giQ==
Date: Thu, 9 Jan 2020 04:01:30 +0000
Message-ID: <BYAPR04MB5749B973CBE3F29822B289C086390@BYAPR04MB5749.namprd04.prod.outlook.com>
References: <BYAPR04MB5749820C322B40C7DBBBCA02863F0@BYAPR04MB5749.namprd04.prod.outlook.com>
	<fda88fd3-2d75-085e-ca15-a29f89c1e781@acm.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [199.255.45.62]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: cb329f34-5929-4495-18d2-08d794b89c35
x-ms-traffictypediagnostic: BYAPR04MB4919:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BYAPR04MB49193C14D9E5E4B5AB28151586390@BYAPR04MB4919.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 02778BF158
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(4636009)(396003)(366004)(39860400002)(136003)(346002)(376002)(189003)(199004)(66476007)(76116006)(4326008)(66946007)(52536014)(7416002)(2906002)(8936002)(316002)(55016002)(5660300002)(64756008)(9686003)(66446008)(66556008)(478600001)(86362001)(6506007)(4744005)(110136005)(33656002)(186003)(81156014)(81166006)(966005)(26005)(7696005)(71200400001)(54906003)(8676002);
	DIR:OUT; SFP:1102; SCL:1; SRVR:BYAPR04MB4919;
	H:BYAPR04MB5749.namprd04.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; MX:1; A:1;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 3ZXksYqzQpQ1M0oemZhFHjRcK6FLR8ejWUuQtqv57mk1/Qp8f3Dr9s7sIcfB8T/WtIxpvRiuE026gPCJcn0xRArqi55k3AwjbnCwhsUO3ojs39OjMd/2pnf2q8Mv7gcKbaadh8QitM0si+yviRXW+D2Fw4CYFr57n+9K+rYb2qSFcbcjSqVIO9uEhYdrMNG4jFRTuXF4ZD7yVtFYIjhM924kEeB8jXN4Xa/N7hcuwDuXWL6FqtrXG6EodbvMjj3HSAmTdiFW2CTcw0O+G0X4OeCj/v4mGn9mn9mZM5gQUCg8EgmO6MVms2RtMROmDEl/TaBCeDaLHttyNncPACDD3y89LNWZQPfc9GVzIKV5/x5AvBwHC0AaMEmJffC3b4fjTM5ZdqC2AD31Wl5015rMOF2D/Jb6P39iEjM2W50CpWf6oH3K/CR1jvqJw65pDHvgtKpJb3sKvUCB9871/DeqP34FA9F/Se8LtHpdOGdLYh8+56GHMauYGJSukX4parpyqeXZeomqFrYdr9HfRhou1w==
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cb329f34-5929-4495-18d2-08d794b89c35
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Jan 2020 04:01:30.9854 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: CNqH9GbHs5JjMO7IGspscsFSpoEE1xgP1NC5X2wX7TXnLsLQ1MFh8LDd5Ei6BkQT3IQhDPBTbLvxOLvtPsRb2Xt4DgoMDDx5ixOGCCP3w7I=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR04MB4919
X-MC-Unique: qTLKB3mxMSm4d2Jjh7qMsA-1
X-MC-Unique: 64HUbJNBPEaXkxxskts9qQ-1
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 00941jjD030056
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Thu, 09 Jan 2020 03:55:26 -0500
Cc: "axboe@kernel.dk" <axboe@kernel.dk>,
	"msnitzer@redhat.com" <msnitzer@redhat.com>,
	"Martin K. Petersen" <martin.petersen@oracle.com>,
	Matias Bjorling <Matias.Bjorling@wdc.com>,
	Stephen Bates <sbates@raithlin.com>,
	"roland@purestorage.com" <roland@purestorage.com>,
	"mpatocka@redhat.com" <mpatocka@redhat.com>,
	Keith Busch <kbusch@kernel.org>,
	"rwheeler@redhat.com" <rwheeler@redhat.com>,
	Christoph Hellwig <hch@lst.de>,
	"frederick.knight@netapp.com" <frederick.knight@netapp.com>,
	"zach.brown@ni.com" <zach.brown@ni.com>
Subject: Re: [dm-devel] [LSF/MM/BFP ATTEND] [LSF/MM/BFP TOPIC] Storage: Copy
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

> Was this last discussed during the 2018 edition of LSF/MM (see also
> https://www.spinics.net/lists/linux-block/msg24986.html)? Has anyone
> taken notes during that session? I haven't found a report of that
> session in the official proceedings (https://lwn.net/Articles/752509/).
>
> Thanks,
>
> Bart.
>

Thanks for sharing this Bart, this is very helpful.

I've not found any notes on lwn for the session which was held in 2018.





--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

