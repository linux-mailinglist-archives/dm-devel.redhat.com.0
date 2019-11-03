Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id 7D637ED67A
	for <lists+dm-devel@lfdr.de>; Mon,  4 Nov 2019 00:42:52 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1572824571;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=mplaS0TnFhEW5KksOLa7TniBVvhOec+yvk4qpAWvtIQ=;
	b=ZKX1copL1cbry3nF7PCd4oOP4nmsoOfOhcyVcCSgvh1mw09KI1lkIx73P9aOE7YJlKs/2W
	DmUuAQYZciigk/kgzK6kyPr6meMo42jP6i54ZykxaEy7Pwtb1YbvdEPhi7W1WYXT+EgJBJ
	VzimbwCRflJuMFWgt/eUNVf+ZH7cr9c=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-219-y4wQidIUMFm1L-n83b2XUA-1; Sun, 03 Nov 2019 18:42:49 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E37CB107ACC2;
	Sun,  3 Nov 2019 23:42:40 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id DA5A05D6C3;
	Sun,  3 Nov 2019 23:42:37 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 6716018089CD;
	Sun,  3 Nov 2019 23:42:16 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id xA3NfseI004523 for <dm-devel@listman.util.phx.redhat.com>;
	Sun, 3 Nov 2019 18:41:55 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id EDD1C600CC; Sun,  3 Nov 2019 23:41:54 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx20.extmail.prod.ext.phx2.redhat.com
	[10.5.110.49])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5AE90600C1;
	Sun,  3 Nov 2019 23:41:49 +0000 (UTC)
Received: from esa6.hgst.iphmx.com (esa6.hgst.iphmx.com [216.71.154.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 38ECB3086245;
	Sun,  3 Nov 2019 23:41:28 +0000 (UTC)
IronPort-SDR: 3RA3metdOtbRAnQPpBez5/glnU7eC9ZYTCaImobvQtRz1ziPNnvGGMEskqMRL07Tkx0rqyrEYz
	SsuTFatMW7TZzyfWBMtXcmJeFjoJKI26GcRIPknpj5v9KmI+f/qULA4RGDoH+RpeBkUs3/58Po
	uZpG3oxXVDWEQTYRWXH64Oi1hZgs2OPOmU5hXlTnRjYAY+xKLiSYfbK3/fvQvui6iuYnPz+Ju/
	MCPcmyZ0TeEpBhN2pxwFvJskxonjcoEGEnXxMgkGQew8/fbT/WMZyBcOda/c2W97S6NCZ5Rx/b
	GW0=
X-IronPort-AV: E=Sophos;i="5.68,265,1569254400"; d="scan'208";a="123601446"
Received: from mail-sn1nam01lp2050.outbound.protection.outlook.com (HELO
	NAM01-SN1-obe.outbound.protection.outlook.com) ([104.47.32.50])
	by ob1.hgst.iphmx.com with ESMTP; 04 Nov 2019 07:41:12 +0800
Received: from BYAPR04MB5816.namprd04.prod.outlook.com (20.179.59.16) by
	BYAPR04MB5734.namprd04.prod.outlook.com (20.179.57.141) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.2408.24; Sun, 3 Nov 2019 23:41:11 +0000
Received: from BYAPR04MB5816.namprd04.prod.outlook.com
	([fe80::4176:5eda:76a2:3c40]) by
	BYAPR04MB5816.namprd04.prod.outlook.com
	([fe80::4176:5eda:76a2:3c40%7]) with mapi id 15.20.2408.024;
	Sun, 3 Nov 2019 23:41:11 +0000
From: Damien Le Moal <Damien.LeMoal@wdc.com>
To: Jens Axboe <axboe@kernel.dk>, "linux-block@vger.kernel.org"
	<linux-block@vger.kernel.org>, "linux-scsi@vger.kernel.org"
	<linux-scsi@vger.kernel.org>, "Martin K . Petersen"
	<martin.petersen@oracle.com>, "dm-devel@redhat.com" <dm-devel@redhat.com>,
	Mike Snitzer <snitzer@redhat.com>
Thread-Topic: [PATCH 0/8] Zone management commands support
Thread-Index: AQHVjM+oAfCMB+wY1ka3IBKYRZIZ0Q==
Date: Sun, 3 Nov 2019 23:41:10 +0000
Message-ID: <BYAPR04MB5816539DCBED2D2C93254D36E77C0@BYAPR04MB5816.namprd04.prod.outlook.com>
References: <20191027140549.26272-1-damien.lemoal@wdc.com>
	<926948c1-d9a0-4156-4639-bbac1d0ba10b@kernel.dk>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [129.253.182.57]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: a88d0958-bd26-4d7e-b958-08d760b74e98
x-ms-traffictypediagnostic: BYAPR04MB5734:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BYAPR04MB573452863D7844CA4245D21DE77C0@BYAPR04MB5734.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:6430;
x-forefront-prvs: 0210479ED8
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(4636009)(376002)(346002)(396003)(366004)(136003)(39860400002)(189003)(199004)(3846002)(186003)(86362001)(25786009)(14444005)(6116002)(256004)(2201001)(99286004)(81166006)(2906002)(9686003)(305945005)(486006)(66446008)(66556008)(66476007)(476003)(64756008)(66946007)(33656002)(8936002)(76116006)(26005)(52536014)(4326008)(5660300002)(8676002)(81156014)(74316002)(446003)(6246003)(6506007)(7696005)(76176011)(2501003)(66066001)(316002)(110136005)(14454004)(54906003)(71200400001)(229853002)(71190400001)(102836004)(6436002)(478600001)(7736002)(55016002)(53546011);
	DIR:OUT; SFP:1102; SCL:1; SRVR:BYAPR04MB5734;
	H:BYAPR04MB5816.namprd04.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; MX:1; A:1;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: eOzYf57toL1AKGCDZx++mIWl7VMjC/ZgcK5/bZtLQ9oCKJMHWpiFbqYc/mUwywpIHosKzKzaYWJKa83J1nTgNL2BNqkNtZ7vIGmZ3GEDg2jgr3UY51gbxguXRldTbEBEW5RyXSGpC/HT/3xlS3bRo7djhMTZj9wRvyrsS4dBnLsCPXoN9r193AsJhqOvc2eD08BovH6exUnTkstkHJY5Sdn3/zaoxvkccNoO3zKCwWMLjyNzMm9jx0VNQi+LDsHCPa46wG+57gpdhFbTkxSqbRgN9q6odvZFMdRmbpG0avN4eczSpg4G5QjzYjOLSWbwQSUe6yJmYkxkt0oMljbpbH9z+XySF+QllfVNnX14enRI0QpLoVRiRbT9NDk7fnb/Tajet90uQc/NdASDQTtHEKn3y/7MymEzI3/Wg2QQtwp3W7I7H2p0VaXTskPo29gn
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a88d0958-bd26-4d7e-b958-08d760b74e98
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Nov 2019 23:41:10.7099 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 7Ijp9lkpOM5w+1pqWaDL1i+EX2fnRSsxfdicJk18jQVvihj6bN6kpCR+bx/naevzyCPgZxzudncBy31lw0t4Pw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR04MB5734
X-Greylist: Sender passed SPF test, Sender IP whitelisted by DNSRBL, ACL 238
	matched, not delayed by milter-greylist-4.5.16 (mx1.redhat.com
	[10.5.110.49]); Sun, 03 Nov 2019 23:41:41 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.49]);
	Sun, 03 Nov 2019 23:41:41 +0000 (UTC) for IP:'216.71.154.45'
	DOMAIN:'esa6.hgst.iphmx.com' HELO:'esa6.hgst.iphmx.com'
	FROM:'Damien.LeMoal@wdc.com' RCPT:''
X-RedHat-Spam-Score: -2.299  (DKIM_SIGNED, DKIM_VALID, RCVD_IN_DNSWL_MED,
	SPF_HELO_NONE) 216.71.154.45 esa6.hgst.iphmx.com
	216.71.154.45 esa6.hgst.iphmx.com
	<prvs=203b7b5bc=Damien.LeMoal@wdc.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.49
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id xA3NfseI004523
X-loop: dm-devel@redhat.com
Cc: Ajay Joshi <Ajay.Joshi@wdc.com>, Fomichev <Dmitry.Fomichev@wdc.com>,
	Hans Holmberg <Hans.Holmberg@wdc.com>,
	Keith Busch <kbusch@kernel.org>, Dmitry,
	Matias Bjorling <Matias.Bjorling@wdc.com>
Subject: Re: [dm-devel] [PATCH 0/8] Zone management commands support
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-MC-Unique: y4wQidIUMFm1L-n83b2XUA-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 2019/11/02 4:01, Jens Axboe wrote:
> On 10/27/19 8:05 AM, Damien Le Moal wrote:
>> This series implements a few improvements and cleanups to zone block
>> device zone reset operations with the first three patches.
>>
>> The remaining of the series patches introduce zone open, close and
>> finish support, allowing users of zoned block devices to explicitly
>> control the condition (state) of zones.
>>
>> While these operations are not stricktly necessary for the correct
>> operation of zoned block devices, the open and close operations can
>> improve performance for some device implementations of the ZBC and ZAC
>> standards under write workloads. The finish zone operation, which
>> transition a zone to the full state, can also be useful to protect a
>> zone data by preventing further zone writes.
>>
>> These operations are implemented by introducing the new
>> REQ_OP_ZONE_OPEN, REQ_OP_ZONE_CLOSE and REQ_OP_ZONE_FINISH request codes
>> and the function blkdev_zone_mgmt() to issue these requests. This new
>> function also replaces the former blkdev_reset_zones() function to reset
>> zones write pointer.
>>
>> The new ioctls BLKOPENZONE, BLKCLOSEZONE and BLKFINISHZONE are also
>> defined to allow applications to issue these new requests without
>> resorting to a device passthrough interface (e.g. SG_IO).
>>
>> Support for these operations is added to the SCSI sd driver, to the dm
>> infrastructure (dm-linear and dm-flakey targets) and to the null_blk
>> driver.
> 
> Can patch 3 go in separately, doesn't look like we need it in this
> series?

Yes, I think it can go in now in 5.4-rc if Martin is willing to take it.
That will create a small conflict in your tree for patch 6 though.

Martin,

Can you take patch 3 now ?

> 
> Also need the DM folks to review/sign off on patch 7. Mike?
> 


-- 
Damien Le Moal
Western Digital Research

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

