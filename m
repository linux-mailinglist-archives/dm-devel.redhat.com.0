Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 62BE0E6056
	for <lists+dm-devel@lfdr.de>; Sun, 27 Oct 2019 03:57:56 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1572145075;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=ITLWtqAk3HarrY0cjJvWYTjV04sx9YBQ3b54on9+cYA=;
	b=EtJEXb5wHMuB+vw6AtkgsPKnOEAlT6vDroIDiR8RXa6H8hLdUGE7OE34fdvmPTz1B7mmOT
	eK1n5R45L1oLw9OAxtjd6aNZyzzL7LmPf7oAPD1bYaT3Rgl5a56UZvN+yrh0F0V5XCIlpx
	VmuvIZwI85WhY5LD3UVd0BtPZLQKOLI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-331-_LbTr-_rMPOIfy0MP_FW2w-1; Sat, 26 Oct 2019 22:57:52 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3074E1005509;
	Sun, 27 Oct 2019 02:57:46 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id F0C5F5D9CD;
	Sun, 27 Oct 2019 02:57:41 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 4D47B180085A;
	Sun, 27 Oct 2019 02:57:25 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x9R2v7Tk028546 for <dm-devel@listman.util.phx.redhat.com>;
	Sat, 26 Oct 2019 22:57:07 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 2EC5910027AD; Sun, 27 Oct 2019 02:57:07 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx07.extmail.prod.ext.phx2.redhat.com
	[10.5.110.31])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 42FE91001B23;
	Sun, 27 Oct 2019 02:57:02 +0000 (UTC)
Received: from esa4.hgst.iphmx.com (esa4.hgst.iphmx.com [216.71.154.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id B3C74C049E10;
	Sun, 27 Oct 2019 02:56:31 +0000 (UTC)
IronPort-SDR: 4o4PvbCpmXAOB1KJEbkX5fQmGrloWzVYpv00t9ablWKBCM8FR2abPt86J14iMxSiI29A8ScmTS
	Ifhtnwv5SwyLp+yp1cdZYefo3nSCBPg6K326DXrz5lQSLD9G+lxtpAY1bE4w0jVok8r1WuQVR+
	6Z9ZfiCDAcLUq3LZY65Mup6uf7NO7dQ4ABbl6H7z5wU/J4ryveRSwo66Y4ZTF/v+0DK+KdK2Hf
	4DW/inMN8GL/iuha+5N3Nnq2Y2vkkQ3mKeH07PhxlilDKFFYBqqYAsT9UX/vJtptixwjF4sf9v
	4Iw=
X-IronPort-AV: E=Sophos;i="5.68,234,1569254400"; d="scan'208";a="121424604"
Received: from mail-cys01nam02lp2056.outbound.protection.outlook.com (HELO
	NAM02-CY1-obe.outbound.protection.outlook.com) ([104.47.37.56])
	by ob1.hgst.iphmx.com with ESMTP; 27 Oct 2019 10:56:22 +0800
Received: from CO2PR04MB2328.namprd04.prod.outlook.com (10.166.95.11) by
	CO2PR04MB2216.namprd04.prod.outlook.com (10.166.94.12) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.2387.20; Sun, 27 Oct 2019 02:56:21 +0000
Received: from CO2PR04MB2328.namprd04.prod.outlook.com
	([fe80::a8ce:2d9:d3b4:806b]) by CO2PR04MB2328.namprd04.prod.outlook.com
	([fe80::a8ce:2d9:d3b4:806b%11]) with mapi id 15.20.2387.025;
	Sun, 27 Oct 2019 02:56:21 +0000
From: Dmitry Fomichev <Dmitry.Fomichev@wdc.com>
To: "dm-devel@redhat.com" <dm-devel@redhat.com>, "agk@redhat.com"
	<agk@redhat.com>, Damien Le Moal <Damien.LeMoal@wdc.com>,
	"zhangxiaoxu5@huawei.com" <zhangxiaoxu5@huawei.com>, "snitzer@redhat.com"
	<snitzer@redhat.com>
Thread-Topic: dm-zoned performance degradation after apply 75d66ffb48efb3 ("dm
	zoned:,properly handle backing device failure")
Thread-Index: AQHVi6CoxFet8iv/B0a4odCWFnMjZKdtzPYA
Date: Sun, 27 Oct 2019 02:56:20 +0000
Message-ID: <38d2a401ad8111ec0e6806f3e165916b18769d6d.camel@wdc.com>
References: <203cc4c8-b380-5b2f-c9e7-766b3f031c8c@huawei.com>
In-Reply-To: <203cc4c8-b380-5b2f-c9e7-766b3f031c8c@huawei.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [199.255.45.64]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: fe0e09b4-f058-4077-0532-08d75a893f24
x-ms-traffictypediagnostic: CO2PR04MB2216:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <CO2PR04MB2216D2F09E17029B8645CE94E1670@CO2PR04MB2216.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 0203C93D51
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(4636009)(366004)(136003)(346002)(39860400002)(376002)(396003)(189003)(199004)(53754006)(6486002)(7736002)(14454004)(76176011)(14444005)(8936002)(99286004)(256004)(4001150100001)(2501003)(186003)(5660300002)(6436002)(478600001)(36756003)(229853002)(66066001)(305945005)(25786009)(110136005)(71200400001)(316002)(71190400001)(2201001)(2616005)(11346002)(6116002)(3846002)(6506007)(8676002)(6512007)(6246003)(476003)(26005)(2906002)(91956017)(86362001)(81156014)(81166006)(64756008)(102836004)(118296001)(66556008)(66446008)(66946007)(66476007)(446003)(486006)(76116006)(21314003);
	DIR:OUT; SFP:1102; SCL:1; SRVR:CO2PR04MB2216;
	H:CO2PR04MB2328.namprd04.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; MX:1; A:1;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: x2sX7pmU4k2K6A6F63De2nQsOLkZEC+5YXcdmpmxCR/SDQz0MfiZh+QGv18R83fAocGTSANOZzRGVWvqcYKBfv70vlFHmiY34ejo3muwsxu2G8Wh+7cKERisf3TkBaYVS8Rd9HH7D+OS4cympVFYgUDYe2s+1V6ov8Xo6x7ohdOFnkC1BUDu9uYr0QAFRxjbkLbm7xE4EAC+89JmrLuWuGARUC0n6gvrJhGPYcbvkqvD4tzqqOjgisHpYrW8/oQyRVe6C4NQEgWtBXWteNNyNfZ9Vc3vfAlJZLYQrLAmmbJ9THMlLHkyJCypu/ifyVfy+E8j01T51KBcJre6/zNxJ1+zNjyT4ychGt1uoEuVOw+Bjf839JXSPF5pdR+PX+V0r6BDTP3TToqYKmPmOFJeYUgS0mlCpzKyUoKrnGHOookUhT3AOTfofBrry9Hd3+8P
Content-ID: <EBFC659219E425459E666222A676A219@namprd04.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fe0e09b4-f058-4077-0532-08d75a893f24
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Oct 2019 02:56:20.9350 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Vnjxj+pXKv91SM9PlbGLx+bmTLekw1RzIE6JXSmU+ekNNjDXXbMnlSRncYA1GilX9FhyvI0y7H0AS+eStkyiAw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO2PR04MB2216
X-Greylist: Sender passed SPF test, Sender IP whitelisted by DNSRBL, ACL 238
	matched, not delayed by milter-greylist-4.5.16 (mx1.redhat.com
	[10.5.110.31]); Sun, 27 Oct 2019 02:56:52 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.31]);
	Sun, 27 Oct 2019 02:56:52 +0000 (UTC) for IP:'216.71.154.42'
	DOMAIN:'esa4.hgst.iphmx.com' HELO:'esa4.hgst.iphmx.com'
	FROM:'Dmitry.Fomichev@wdc.com' RCPT:''
X-RedHat-Spam-Score: -2.399  (DKIM_SIGNED, DKIM_VALID, DKIM_VALID_AU,
	RCVD_IN_DNSWL_MED,
	SPF_HELO_NONE) 216.71.154.42 esa4.hgst.iphmx.com 216.71.154.42
	esa4.hgst.iphmx.com <prvs=196ac7851=Dmitry.Fomichev@wdc.com>
X-Scanned-By: MIMEDefang 2.78 on 10.5.110.31
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-MIME-Autoconverted: from base64 to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id x9R2v7Tk028546
X-loop: dm-devel@redhat.com
Subject: Re: [dm-devel] dm-zoned performance degradation after apply
 75d66ffb48efb3 ("dm zoned:, properly handle backing device failure")
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-MC-Unique: _LbTr-_rMPOIfy0MP_FW2w-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Zhang,

I just did some testing of this scenario with a recent kernel that includes this patch.

The log below is a run in QEMU with 8 CPUs and it took 18.5 minutes to create the FS on a
14TB ATA drive. Doing the same thing on bare metal with 32 CPUs takes 10.5 minutes in my
environment. However, when doing the same test with a SAS drive, the run takes 43 minutes.
This is not quite the degradation you are observing, but still a big performance hit.

Is the disk that you are using SAS or SATA?

My current guess is that sd driver may generate some TEST UNIT READY commands to check if
the drive is really online as a part of check_events() processing. For ATA drives, this is
nearly a NOP since all TURs are completed internally in libata. But, in SCSI case, these
blocking TURs are issued to the drive and certainly may degrade performance.

The check_events() call has been added to bdev_device_is_dying() because simply calling
bdev_queue_dying() doesn't cover the situation when the drive gets offlined in SCSI layer.
It might be possible to only call check_events() once before every reclaim run and to avoid
calling it in I/O mapping path. If this works, the overhead would likely be acceptable.
I am going to take a look into this.

Regards,
Dmitry

[root@xxx dmz]# uname -a
Linux xxx 5.4.0-rc1-DMZ+ #1 SMP Fri Oct 11 11:23:13 PDT 2019 x86_64 x86_64 x86_64 GNU/Linux
[root@xxx dmz]# lsscsi
[0:0:0:0]    disk    QEMU     QEMU HARDDISK    2.5+  /dev/sda 
[1:0:0:0]    zbc     ATA      HGST HSH721415AL T240  /dev/sdb 
[root@xxx dmz]# ./setup-dmz test /dev/sdb
[root@xxx dmz]# cat /proc/kallsyms | grep dmz_bdev_is_dying
(standard input):90782:ffffffffc070a401 t dmz_bdev_is_dying.cold	[dm_zoned]
(standard input):90849:ffffffffc0706e10 t dmz_bdev_is_dying	[dm_zoned]
[root@xxx dmz]# time mkfs.ext4 /dev/mapper/test
mke2fs 1.44.6 (5-Mar-2019)
Discarding device blocks: done                            
Creating filesystem with 3660840960 4k blocks and 457605120 inodes
Filesystem UUID: 4536bacd-cfb5-41b2-b0bf-c2513e6e3360
Superblock backups stored on blocks: 
	32768, 98304, 163840, 229376, 294912, 819200, 884736, 1605632, 2654208, 
	4096000, 7962624, 11239424, 20480000, 23887872, 71663616, 78675968, 
	102400000, 214990848, 512000000, 550731776, 644972544, 1934917632, 
	2560000000

Allocating group tables: done                            
Writing inode tables: done                            
Creating journal (262144 blocks): done
Writing superblocks and filesystem accounting information: done         


real	18m30.867s
user	0m0.172s
sys	0m11.198s


On Sat, 2019-10-26 at 09:56 +0800, zhangxiaoxu (A) wrote:
> Hi all, when I 'mkfs.ext4' on the dmz device based on 10T smr disk,
> it takes more than 10 hours after apply 75d66ffb48efb3 ("dm zoned:
> properly handle backing device failure").
> 
> After delete the 'check_events' in 'dmz_bdev_is_dying', it just
> take less than 12 mins.
> 
> I test it based on 4.19 branch.
> Must we do the 'check_events' at mapping path, reclaim or metadata I/O?
> 
> Thanks.
> 

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

