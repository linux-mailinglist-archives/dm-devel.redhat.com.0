Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id 2349AE8339
	for <lists+dm-devel@lfdr.de>; Tue, 29 Oct 2019 09:32:02 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1572337921;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=7som78ibdqtnTE5HkeNzDrb7Hw3yUwhqaKCOk+zhn18=;
	b=TEcYO/moLhOoRJyF+pxS5aDjQB8v3U1IFjDAgOvCSkFPGGtNOuV71nwd01mhRCj4L38ryA
	6qd8z74v44Fo3AwkLmPCnkZ00Sn9I1zKRPgczYzg/DbMCz7SAdFr0EiedX6d7UuEmyH/iD
	ytZtF0crhOmVczBzSEK0qVZnQcO87y8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-235-6C9AOFDgM_yygxWmPrK4bA-1; Tue, 29 Oct 2019 04:31:58 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CF77D107AD31;
	Tue, 29 Oct 2019 08:31:53 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 928965C1B2;
	Tue, 29 Oct 2019 08:31:53 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id CF5611819AC0;
	Tue, 29 Oct 2019 08:31:52 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x9S8bsRJ006985 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 28 Oct 2019 04:37:54 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 382AE5D6B0; Mon, 28 Oct 2019 08:37:54 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx01.extmail.prod.ext.phx2.redhat.com
	[10.5.110.25])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E04CD5D6A0;
	Mon, 28 Oct 2019 08:37:49 +0000 (UTC)
Received: from esa4.hgst.iphmx.com (esa4.hgst.iphmx.com [216.71.154.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 0327D8535C;
	Mon, 28 Oct 2019 08:37:28 +0000 (UTC)
IronPort-SDR: vP2huSyLzmL9SBOzCZwGBvjUIwsLHDqnIrgfKkXmgfod8WbgMlUXhg/pkoOKBDfrlRc18F5M3e
	v+u8Xb4irs2AtFOeMFiXy0WpHh/1rlFAA2PnFZKQ57qwMZouSRwdcZUxajqgGlJHFx07BeXm8R
	QawPMRn0Wi0lUStH7sc1ucuESYxjhjoQkvEMjQlrYwFGvuxrlCblKNd01Wg/sPEV2GZ4ibEC0f
	7iUCCRPxIY/PfYDKjgMnfH93hjsP9wRiQJ6L/V8cyZCjkjm/cLAUc4o+3Ar8A3+6qx9iIyBz/0
	AOE=
X-IronPort-AV: E=Sophos;i="5.68,239,1569254400"; d="scan'208";a="121475485"
Received: from mail-sn1nam01lp2056.outbound.protection.outlook.com (HELO
	NAM01-SN1-obe.outbound.protection.outlook.com) ([104.47.32.56])
	by ob1.hgst.iphmx.com with ESMTP; 28 Oct 2019 16:37:18 +0800
Received: from BYAPR04MB5749.namprd04.prod.outlook.com (20.179.57.21) by
	BYAPR04MB3813.namprd04.prod.outlook.com (52.135.215.13) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.2387.24; Mon, 28 Oct 2019 08:37:17 +0000
Received: from BYAPR04MB5749.namprd04.prod.outlook.com
	([fe80::34a1:afd2:e5c1:77c7]) by
	BYAPR04MB5749.namprd04.prod.outlook.com
	([fe80::34a1:afd2:e5c1:77c7%6]) with mapi id 15.20.2387.023;
	Mon, 28 Oct 2019 08:37:17 +0000
From: Chaitanya Kulkarni <Chaitanya.Kulkarni@wdc.com>
To: Damien Le Moal <Damien.LeMoal@wdc.com>, "linux-block@vger.kernel.org"
	<linux-block@vger.kernel.org>, Jens Axboe <axboe@kernel.dk>,
	"linux-scsi@vger.kernel.org" <linux-scsi@vger.kernel.org>, "Martin K .
	Petersen" <martin.petersen@oracle.com>, "dm-devel@redhat.com"
	<dm-devel@redhat.com>, Mike Snitzer <snitzer@redhat.com>
Thread-Topic: [PATCH 2/8] block: Simplify REQ_OP_ZONE_RESET_ALL handling
Thread-Index: AQHVjM+qshxVC7ah2EOUEKAVKMXumA==
Date: Mon, 28 Oct 2019 08:37:17 +0000
Message-ID: <BYAPR04MB57490F22E67DC5B172A3A9FE86660@BYAPR04MB5749.namprd04.prod.outlook.com>
References: <20191027140549.26272-1-damien.lemoal@wdc.com>
	<20191027140549.26272-3-damien.lemoal@wdc.com>
	<BYAPR04MB5749C25A8558C0ED9AB3EA6786660@BYAPR04MB5749.namprd04.prod.outlook.com>
	<BYAPR04MB58160668CEB54919B22AC2FBE7660@BYAPR04MB5816.namprd04.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [199.255.44.172]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 3578688b-6dfb-4220-a1df-08d75b820ab2
x-ms-traffictypediagnostic: BYAPR04MB3813:
x-ms-exchange-purlcount: 1
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BYAPR04MB3813BB24733CC3D2A9C850B386660@BYAPR04MB3813.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:632;
x-forefront-prvs: 0204F0BDE2
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(4636009)(136003)(366004)(39860400002)(376002)(346002)(396003)(199004)(189003)(486006)(476003)(6506007)(14454004)(446003)(53546011)(966005)(7736002)(6436002)(66946007)(55016002)(9686003)(6306002)(66066001)(54906003)(76176011)(66476007)(25786009)(316002)(305945005)(45080400002)(76116006)(74316002)(110136005)(64756008)(66446008)(66556008)(478600001)(26005)(186003)(8676002)(81166006)(81156014)(8936002)(102836004)(7696005)(99286004)(33656002)(256004)(71200400001)(71190400001)(6116002)(3846002)(6246003)(86362001)(5660300002)(2906002)(4326008)(14444005)(52536014)(2501003)(229853002)(21314003);
	DIR:OUT; SFP:1102; SCL:1; SRVR:BYAPR04MB3813;
	H:BYAPR04MB5749.namprd04.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; A:1; MX:1;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: MxJG7Pfm9HUStjoBxW14XdyAP90l31fy8mCVtWRDlRcAejRKcJKA7Gc7zRq4jnpU6WrsXsNOdmqsXa3+5V+N8WgLk0WEGaVG2kel5XfrcPXt40l4qAuByiPR0MpWVXiTEDGo+HkYfq/vM4GfVeSoB0Z+wAXvFnnpY1XvfFAn8VdMFq+jryY9bUlWOyEUCx3u4zsqT5I+KzQR1KnzFfsUBjiM/f3ian9aluG65zZaSBtOjVsGJIoGw56QHZf689sQTouIBCDem3M+QJmpcWJo1KHZvzRp8Uu2C5CMYYykilpFQwk+hw/j3hCP3Udg1aGBHniXJCRDyyDGAS3UnrR/ZoN/DhRpZoQb1wWtMbb90Sjhd+xJjY+w5HrhTjvsUQNdUPQKIEdemFTB8twwASGpAPbVNCxj0SZfygPPBOLO1UvvXDDZvLngkSFan1iMFrea
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3578688b-6dfb-4220-a1df-08d75b820ab2
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Oct 2019 08:37:17.8300 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: zcL8v2F7n4I/z678V+XQ4pT2tpvrKSB/KRGbHEzkB9Ye2mwMuA84vGeLh0FTnvz2nDgkpgGZyr/Ea9CW93x+BMiNnQcZ0clqK8bMhMqzqYk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR04MB3813
X-Greylist: Sender passed SPF test, Sender IP whitelisted by DNSRBL, ACL 238
	matched, not delayed by milter-greylist-4.5.16 (mx1.redhat.com
	[10.5.110.25]); Mon, 28 Oct 2019 08:37:41 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.25]);
	Mon, 28 Oct 2019 08:37:41 +0000 (UTC) for IP:'216.71.154.42'
	DOMAIN:'esa4.hgst.iphmx.com' HELO:'esa4.hgst.iphmx.com'
	FROM:'Chaitanya.Kulkarni@wdc.com' RCPT:''
X-RedHat-Spam-Score: -2.299  (DKIM_SIGNED, DKIM_VALID, RCVD_IN_DNSWL_MED,
	SPF_HELO_NONE) 216.71.154.42 esa4.hgst.iphmx.com
	216.71.154.42 esa4.hgst.iphmx.com
	<prvs=197297270=Chaitanya.Kulkarni@wdc.com>
X-Scanned-By: MIMEDefang 2.83 on 10.5.110.25
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id x9S8bsRJ006985
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Tue, 29 Oct 2019 04:31:28 -0400
Cc: Ajay Joshi <Ajay.Joshi@wdc.com>, Fomichev <Dmitry.Fomichev@wdc.com>,
	Hans Holmberg <Hans.Holmberg@wdc.com>,
	Keith Busch <kbusch@kernel.org>, Dmitry,
	Matias Bjorling <Matias.Bjorling@wdc.com>
Subject: Re: [dm-devel] [PATCH 2/8] block: Simplify REQ_OP_ZONE_RESET_ALL
	handling
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-MC-Unique: 6C9AOFDgM_yygxWmPrK4bA-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 10/28/19 12:54 AM, Damien Le Moal wrote:
> Isn't the trace point under submit_bio() in
> generic_make_request_checks() ? So removing the function is not a
> problem for tracing as far as I can tell. Am I missing something ?

Yes you are right, I completely missed that.

Sorry I've created confusion with block_dump and tracepoint.

Block trace code is fine.

The block_dump code under the submit_bio() is only dumps the bios with
the data:-


1171                 if (unlikely(block_dump)) {
1172                         char b[BDEVNAME_SIZE];
1173                         printk(KERN_DEBUG "%s(%d): %s block %Lu on 
%s (%u sectors)\n",
1174                         current->comm, task_pid_nr(current),
1175                                 op_is_write(bio_op(bio)) ? "WRITE" 
: "READ",
1176                                 (unsigned long 
long)bio->bi_iter.bi_sector,
1177                                 bio_devname(bio, b), count);
1178                 }


I've posted patch-series [1] in the past to move that code out but it 
didn't go anywhere in anticipation of more data less requests.

Since it is taking longer to have blktrace extensions RFC to move 
forward and [1] didn't go anywhere I wanted to use block_dump
parameter in the blk-zoned.c (not an ideal situation) so that we can 
have atleast minimal debug support for the new REQ_OP_ZONE_XXX 
operations until we get block trace extensions in the kernel.

Nonetheless, I'll just a send a patch on the top of this which will
make discussion much easier.


[1] :- 
https://lore.kernel.org/linux-block/DM6PR04MB57546ECC4CFDDB5535E3382586FB0@DM6PR04MB5754.namprd04.prod.outlook.com/T/

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

