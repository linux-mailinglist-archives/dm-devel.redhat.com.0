Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 719BADA3F0
	for <lists+dm-devel@lfdr.de>; Thu, 17 Oct 2019 04:40:48 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id AC73D3084244;
	Thu, 17 Oct 2019 02:40:43 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D373860872;
	Thu, 17 Oct 2019 02:40:38 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id B63664E58A;
	Thu, 17 Oct 2019 02:40:26 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x9H2dsW6001054 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 16 Oct 2019 22:39:54 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 7E3A05D9DC; Thu, 17 Oct 2019 02:39:54 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx25.extmail.prod.ext.phx2.redhat.com
	[10.5.110.66])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3C5235DA8C;
	Thu, 17 Oct 2019 02:39:44 +0000 (UTC)
Received: from esa1.hgst.iphmx.com (esa1.hgst.iphmx.com [68.232.141.245])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id BB21E10C0922;
	Thu, 17 Oct 2019 02:39:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
	t=1571279971; x=1602815971;
	h=from:to:cc:subject:date:message-id:references:
	content-transfer-encoding:mime-version;
	bh=O6jgexmDCF91LW0yufro4R2CgVXXiSAVcyL0OuaH+CI=;
	b=eANBT17bM/BkHI+6mxRqffQImtSH5Ha1LIAdAXh2NKMZVMdDoc4KNx4z
	2gv7hYDdT3DYiH6OkBJ7sBdMUVaeimtNQLBL9rgBbvz/LNa68A+WUJhUL
	1kIgl7Xwcz5TGzd8T5k6a9PEjPRfz/4mfpeBQgddrm5+zu8cU3zye/ISP
	gYvn5f1qFEbJzD2M9sdXxlFVzY5duB+qHD9aMFeir7xUZwNLIn+pjQHcs
	V0UYIF4n7jMaOetuBWSo1nfn1ZoXs2dtw7R+oEZdoCSFNTF8tZJZWFsBG
	JkZWMRbYUu7c452ibh0sHJO2QNI7zRkDpKTZITMm1lneGadMP9X5WUHbU w==;
IronPort-SDR: nPUbn3FVwUQIRJWV8LzpOLopzdhcao6nU8MZYHOxBsCrcCU2fy5/9v7quDQOkNm/kLWXjHsWJu
	w73pmY+DHF9vTjV2IaQXeGN+cRteaRNVDxiMNoUBSE5IMAwBMGiJzH4kAGzuqK3OFhmbVuqT3G
	PcMDQkc53NY4Qgs/nlrFUj4r1mfsoM7HMPK7HMrR+dFtt/VfIKMQEKKrgra8UqhSzh0Fv2yuHN
	BH5hDnwhGEi/d8K0/xCGwld+0C230IiigkIKMB9clltekei7R5kcnaSEL43ppDPaXvZNL7mrYo
	D8A=
X-IronPort-AV: E=Sophos;i="5.67,306,1566835200"; d="scan'208";a="227775231"
Received: from mail-by2nam05lp2053.outbound.protection.outlook.com (HELO
	NAM05-BY2-obe.outbound.protection.outlook.com) ([104.47.50.53])
	by ob1.hgst.iphmx.com with ESMTP; 17 Oct 2019 10:39:04 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
	b=WfABKx36UFnKm08niOojD2y4379N/rUqadr4KCok9AcLFZVoHoC3eHdBoBKHasmSPnPQdn7GZhGyuNqLsti1N4UGN4Cs9xm/ICJjKGTE1YO+YIJ1fybj/2S4aeCURGOOF42UW2cLYcdxGFDxhji4HbTjnDcgy2bbyx8I+4XmBOL1WgC7XDBO89q9LorSlCWvMOPz94n0iEQEl3tJ0kY2pQi4Ss+ikmHFm21D4jhdXaNZZ6xphZprXKj3jwJ4hPAgHqkEnwn7vpN4OpIPUF08+BgWnOnzV1s+3vp70RgRA3KoQ5bw2zg/yYTp8veh4u2YkLNVDLg0zgkCHdRsPAdNnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
	s=arcselector9901;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=HI2pujzCwEt4kR2X7iX0HvHdW+0kGLaSgCmLjXQZaQc=;
	b=a5hpXNtfHZXBl3fbbr3FP8OEf83KJqnmQKLP8CP5PKYoum+zFl/u9EHEya1tBeVV6CP+gF0dcg05V9Ds3YnJnurUvGWk8rHk/Oj0QIoL++pCMr5GR7Ztdgo+bY7WbdfjxqWlq3Cs9pF8CXZIxMC0oGApztDovT+n1yyHm2jjeg3XeAWKTEjpPcyG90zm/+9NHYqJfFduxRn/c6wkAaJrFyKfpg7oAGmSOxJQX3ndM6Ni7cPWHp9dzuG82zePYe6Qk6G++jYD3txWYgBEwJJYsBaoXMDTetz6yAUPTrFMVY22uh7A4gRf/po+MGIsJK0EyncGsGE8JOR45HpSvMyfIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
	smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com;
	dkim=pass header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com; 
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=HI2pujzCwEt4kR2X7iX0HvHdW+0kGLaSgCmLjXQZaQc=;
	b=jCApJUp1FEoNVYWOlgSQePoGk3/iXlVFoGsoARsWOSYbKLoAN8zfdJAKAUn9jm8DO63AI7dWnssnfqbPZonU90tdo7FOWwtSmjcB83n+fmeO3pFoA6pFA2yPnH59ONCWgT3IiYA3D5h9pTLu6n6P07G1GYbtgeWJDTjBd2GkQnk=
Received: from BYAPR04MB5816.namprd04.prod.outlook.com (20.179.59.16) by
	BYAPR04MB5798.namprd04.prod.outlook.com (20.179.58.220) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.2347.16; Thu, 17 Oct 2019 02:39:03 +0000
Received: from BYAPR04MB5816.namprd04.prod.outlook.com
	([fe80::f07b:aaec:410d:bcf3]) by
	BYAPR04MB5816.namprd04.prod.outlook.com
	([fe80::f07b:aaec:410d:bcf3%4]) with mapi id 15.20.2347.023;
	Thu, 17 Oct 2019 02:39:03 +0000
From: Damien Le Moal <Damien.LeMoal@wdc.com>
To: Eric Farman <farman@linux.ibm.com>, "linux-block@vger.kernel.org"
	<linux-block@vger.kernel.org>, Jens Axboe <axboe@kernel.dk>,
	"linux-scsi@vger.kernel.org" <linux-scsi@vger.kernel.org>, "Martin K .
	Petersen" <martin.petersen@oracle.com>, "dm-devel@redhat.com"
	<dm-devel@redhat.com>, Mike Snitzer <snitzer@redhat.com>
Thread-Topic: [PATCH v5 5/7] block: Delay default elevator initialization
Thread-Index: AQHVY8+T2S3IbSTbq0KOEOMIxhuwmg==
Date: Thu, 17 Oct 2019 02:39:03 +0000
Message-ID: <BYAPR04MB5816A2CFCDA1D7ED10455D93E76D0@BYAPR04MB5816.namprd04.prod.outlook.com>
References: <20190905095135.26026-1-damien.lemoal@wdc.com>
	<20190905095135.26026-6-damien.lemoal@wdc.com>
	<9355c25f-61d7-b290-7d60-552ef4206e8c@linux.ibm.com>
	<f5f3a25b-19f5-bf29-2f38-f40f59860aeb@linux.ibm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=Damien.LeMoal@wdc.com; 
x-originating-ip: [199.255.47.12]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: fe3befb9-e04c-421d-6c65-08d752ab2c88
x-ms-office365-filtering-ht: Tenant
x-ms-traffictypediagnostic: BYAPR04MB5798:
x-microsoft-antispam-prvs: <BYAPR04MB5798957020A707B33D41C462E76D0@BYAPR04MB5798.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 01930B2BA8
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(4636009)(376002)(39860400002)(346002)(136003)(396003)(366004)(189003)(199004)(6436002)(99286004)(25786009)(66066001)(52536014)(66556008)(64756008)(8676002)(81156014)(7696005)(76176011)(33656002)(229853002)(9686003)(66446008)(81166006)(186003)(66476007)(66946007)(102836004)(6246003)(55016002)(26005)(6506007)(53546011)(76116006)(4326008)(446003)(5660300002)(476003)(486006)(8936002)(7736002)(71200400001)(305945005)(74316002)(14454004)(3846002)(71190400001)(478600001)(86362001)(6116002)(91956017)(2501003)(54906003)(2906002)(110136005)(256004)(316002)(5024004)(14444005);
	DIR:OUT; SFP:1102; SCL:1; SRVR:BYAPR04MB5798;
	H:BYAPR04MB5816.namprd04.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; MX:1; A:1; 
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: mmlBBpGDmy4SjlybHokU4Ar+ghewI/xbTZNCa1M6eEsPwxDqtgdQnV6yXmaF+CR0K+A7xOn/9/P1mPaFiri1zXafrsI41HS34CVYzdsW/09B7T4sgUHrNIKuH2HSfU4cLwIa46sZ+Ily8J2CSlBjXNovkxTwmT9bG1XkCRdJuvJWlFhnWNe0IvPvnz5Pqa/g7Ujx3zXShXPAFFq/uScjHKmAwpuv4t8rM0KqfLTnvRGYOUVuo0Qj0S9uIKJf5JKvmMPhPzIfpBYM38BYvz48GlV7m0l1PJ7z4EpgkwvEvFQRzvldfxG0QiFSS6vN/ORu8fakkPBkcd+kg8uCCTYNcmHz5o2vjjQ6RthGsh0f/rofs9wuHrx1RqC20ISppMTUWUK13NZyC6h448VHf562K7nB3MLMQcf4hFIcTieJTeU=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fe3befb9-e04c-421d-6c65-08d752ab2c88
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Oct 2019 02:39:03.4568 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 6wrtWdYM9wsmAEI3x2PG/vFsREVzNiSOJu0j3HWsue//PA2tHYI79TPk9poBwyuIUUMuwAxGTVHBj8EuvEx07w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR04MB5798
X-Greylist: Sender passed SPF test, Sender IP whitelisted by DNSRBL, ACL 238
	matched, not delayed by milter-greylist-4.6.2 (mx1.redhat.com
	[10.5.110.66]); Thu, 17 Oct 2019 02:39:31 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.6.2 (mx1.redhat.com [10.5.110.66]);
	Thu, 17 Oct 2019 02:39:31 +0000 (UTC) for IP:'68.232.141.245'
	DOMAIN:'esa1.hgst.iphmx.com' HELO:'esa1.hgst.iphmx.com'
	FROM:'Damien.LeMoal@wdc.com' RCPT:''
X-RedHat-Spam-Score: -2.299  (DKIM_SIGNED, DKIM_VALID, RCVD_IN_DNSWL_MED,
	SPF_HELO_NONE) 68.232.141.245 esa1.hgst.iphmx.com
	68.232.141.245 esa1.hgst.iphmx.com
	<prvs=18651e114=Damien.LeMoal@wdc.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.66
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id x9H2dsW6001054
X-loop: dm-devel@redhat.com
Cc: Christian Borntraeger <borntraeger@de.ibm.com>,
	Ming Lei <ming.lei@redhat.com>
Subject: Re: [dm-devel] [PATCH v5 5/7] block: Delay default elevator
	initialization
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: dm-devel-bounces@redhat.com
Errors-To: dm-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.40]); Thu, 17 Oct 2019 02:40:46 +0000 (UTC)

On 2019/10/17 3:51, Eric Farman wrote:
> 
> 
> On 10/1/19 4:46 PM, Eric Farman wrote:
>>
>>
>> On 9/5/19 5:51 AM, Damien Le Moal wrote:
>>> When elevator_init_mq() is called from blk_mq_init_allocated_queue(),
>>> the only information known about the device is the number of hardware
>>> queues as the block device scan by the device driver is not completed
>>> yet for most drivers. The device type and elevator required features
>>> are not set yet, preventing to correctly select the default elevator
>>> most suitable for the device.
>>>
>>> This currently affects all multi-queue zoned block devices which default
>>> to the "none" elevator instead of the required "mq-deadline" elevator.
>>> These drives currently include host-managed SMR disks connected to a
>>> smartpqi HBA and null_blk block devices with zoned mode enabled.
>>> Upcoming NVMe Zoned Namespace devices will also be affected.
>>>
>>> Fix this by adding the boolean elevator_init argument to
>>> blk_mq_init_allocated_queue() to control the execution of
>>> elevator_init_mq(). Two cases exist:
>>> 1) elevator_init = false is used for calls to
>>>    blk_mq_init_allocated_queue() within blk_mq_init_queue(). In this
>>>    case, a call to elevator_init_mq() is added to __device_add_disk(),
>>>    resulting in the delayed initialization of the queue elevator
>>>    after the device driver finished probing the device information. This
>>>    effectively allows elevator_init_mq() access to more information
>>>    about the device.
>>> 2) elevator_init = true preserves the current behavior of initializing
>>>    the elevator directly from blk_mq_init_allocated_queue(). This case
>>>    is used for the special request based DM devices where the device
>>>    gendisk is created before the queue initialization and device
>>>    information (e.g. queue limits) is already known when the queue
>>>    initialization is executed.
>>>
>>> Additionally, to make sure that the elevator initialization is never
>>> done while requests are in-flight (there should be none when the device
>>> driver calls device_add_disk()), freeze and quiesce the device request
>>> queue before calling blk_mq_init_sched() in elevator_init_mq().
>>>
>>> Signed-off-by: Damien Le Moal <damien.lemoal@wdc.com>
>>
>> Coincidentally, I had been looking into a problem that is fixed in
>> 5.4-rc1 by this patch.  Thanks for that!
>>
>> The problem was a delay during boot of a KVM guest with virtio-scsi
>> devices (or hotplug of such a device to a guest) in recent releases,
>> especially when virtio-scsi is configured as a module.  The symptoms
>> look like:
>>
>> [    0.975315] virtio_blk virtio2: [vda] 1803060 4096-byte logical
>> blocks (7.39 GB/6.88 GiB)
>> [    0.977859] scsi host0: Virtio SCSI HBA
>> [    0.980339] scsi 0:0:0:0: Direct-Access     QEMU     QEMU HARDDISK
>> 2.5+ PQ: 0 ANSI: 5
>> [    0.981685]  vda:VOL1/  0XA906: vda1
>> [    0.988253] alg: No test for crc32be (crc32be-vx)
>> ...stall...
>> [   24.544920] sd 0:0:0:0: Power-on or device reset occurred
>> [   24.545176] sd 0:0:0:0: Attached scsi generic sg0 type 0
>> [   24.545292] sd 0:0:0:0: [sda] 385 512-byte logical blocks: (197
>> kB/193 KiB)
>> [   24.545368] sd 0:0:0:0: [sda] Write Protect is off
>> [   24.545416] sd 0:0:0:0: [sda] Mode Sense: 63 00 00 08
>> [   24.545456] sd 0:0:0:0: [sda] Write cache: enabled, read cache:
>> enabled, doesn't support DPO or FUA
>> [   24.547033] sd 0:0:0:0: [sda] Attached SCSI disk
>>
>> I debugged this down to the same behavior described/fixed back in 3.18
>> by commit 17497acbdce9 ("blk-mq, percpu_ref: start q->mq_usage_counter
>> in atomic mode"), and for the same reason.  The delay starts occurring
>> as soon as q->q_usage_counter is converted to percpu for the one LUN tha
>> twas found, while scsi_scan_channel() is still working on its loop of
>> mostly non-existent devices.  Exactly when this problem started
>> re-occuring is not certain to me, though I did see this problem with 5.2
>> on linux-stable.
> 
> This problem started occurring reliably with kernel 4.16 because of
> commit b5b6e8c8d3b4 ("scsi: virtio_scsi: fix IO hang caused by automatic
> irq vector affinity") which forced blk-mq on for virtio-scsi devices.
> 
> I'm able to reproduce the behavior (fixed by this commit) on 4.15.0, as
> well as 4.14.0 and 4.9.0, if I enable SCSI_MQ_DEFAULT in the kernel
> config.  I cannot reproduce it with 4.4.0, but didn't chase further to
> see why that was the case.

This is really strange since in 4.9 there is no elevator initialization being
done for a mq device. So with SCSI_MQ_DEFAULT set, you should end up with no
elevator for your disk and the presence or not of this patch or variations of it
should not change anything.

This patch may be hiding your problem root cause rather than fixing it...

> 
> That force_blk_mq commit went into linux-stable, so SCSI_MQ_DEFAULT need
> not be enabled on 4.14.y or 4.9.y stable branches to see the behavior
> fixed by this commit.
> 
>>
>> When I run with a 5.3 kernel, the problem is easily reproducible.  So I
>> bisected between 5.3 and 5.4-rc1, and got here.  Cherry-picking this
>> patch on top of 5.3 cleans up the boot/hotplug process and removes any
>> stall.  Any chance this could be cc'd to stable?  
> 
> Please?  Anything I can do to help with that effort?
> 
> Thanks,
> Eric
> 
>> Any data someone wants
>> to see behavioral changes?
>>
>> Thanks,
>> Eric
>>
>>> ---
>>>  block/blk-mq.c         | 12 +++++++++---
>>>  block/elevator.c       |  7 +++++++
>>>  block/genhd.c          |  9 +++++++++
>>>  drivers/md/dm-rq.c     |  2 +-
>>>  include/linux/blk-mq.h |  3 ++-
>>>  5 files changed, 28 insertions(+), 5 deletions(-)
>>>
>>> diff --git a/block/blk-mq.c b/block/blk-mq.c
>>> index ee4caf0c0807..240416057f28 100644
>>> --- a/block/blk-mq.c
>>> +++ b/block/blk-mq.c
>>> @@ -2689,7 +2689,11 @@ struct request_queue *blk_mq_init_queue(struct blk_mq_tag_set *set)
>>>  	if (!uninit_q)
>>>  		return ERR_PTR(-ENOMEM);
>>>  
>>> -	q = blk_mq_init_allocated_queue(set, uninit_q);
>>> +	/*
>>> +	 * Initialize the queue without an elevator. device_add_disk() will do
>>> +	 * the initialization.
>>> +	 */
>>> +	q = blk_mq_init_allocated_queue(set, uninit_q, false);
>>>  	if (IS_ERR(q))
>>>  		blk_cleanup_queue(uninit_q);
>>>  
>>> @@ -2840,7 +2844,8 @@ static unsigned int nr_hw_queues(struct blk_mq_tag_set *set)
>>>  }
>>>  
>>>  struct request_queue *blk_mq_init_allocated_queue(struct blk_mq_tag_set *set,
>>> -						  struct request_queue *q)
>>> +						  struct request_queue *q,
>>> +						  bool elevator_init)
>>>  {
>>>  	/* mark the queue as mq asap */
>>>  	q->mq_ops = set->ops;
>>> @@ -2902,7 +2907,8 @@ struct request_queue *blk_mq_init_allocated_queue(struct blk_mq_tag_set *set,
>>>  	blk_mq_add_queue_tag_set(set, q);
>>>  	blk_mq_map_swqueue(q);
>>>  
>>> -	elevator_init_mq(q);
>>> +	if (elevator_init)
>>> +		elevator_init_mq(q);
>>>  
>>>  	return q;
>>>  
>>> diff --git a/block/elevator.c b/block/elevator.c
>>> index 520d6b224b74..096a670d22d7 100644
>>> --- a/block/elevator.c
>>> +++ b/block/elevator.c
>>> @@ -712,7 +712,14 @@ void elevator_init_mq(struct request_queue *q)
>>>  	if (!e)
>>>  		return;
>>>  
>>> +	blk_mq_freeze_queue(q);
>>> +	blk_mq_quiesce_queue(q);
>>> +
>>>  	err = blk_mq_init_sched(q, e);
>>> +
>>> +	blk_mq_unquiesce_queue(q);
>>> +	blk_mq_unfreeze_queue(q);
>>> +
>>>  	if (err) {
>>>  		pr_warn("\"%s\" elevator initialization failed, "
>>>  			"falling back to \"none\"\n", e->elevator_name);
>>> diff --git a/block/genhd.c b/block/genhd.c
>>> index 54f1f0d381f4..26b31fcae217 100644
>>> --- a/block/genhd.c
>>> +++ b/block/genhd.c
>>> @@ -695,6 +695,15 @@ static void __device_add_disk(struct device *parent, struct gendisk *disk,
>>>  	dev_t devt;
>>>  	int retval;
>>>  
>>> +	/*
>>> +	 * The disk queue should now be all set with enough information about
>>> +	 * the device for the elevator code to pick an adequate default
>>> +	 * elevator if one is needed, that is, for devices requesting queue
>>> +	 * registration.
>>> +	 */
>>> +	if (register_queue)
>>> +		elevator_init_mq(disk->queue);
>>> +
>>>  	/* minors == 0 indicates to use ext devt from part0 and should
>>>  	 * be accompanied with EXT_DEVT flag.  Make sure all
>>>  	 * parameters make sense.
>>> diff --git a/drivers/md/dm-rq.c b/drivers/md/dm-rq.c
>>> index 21d5c1784d0c..3f8577e2c13b 100644
>>> --- a/drivers/md/dm-rq.c
>>> +++ b/drivers/md/dm-rq.c
>>> @@ -563,7 +563,7 @@ int dm_mq_init_request_queue(struct mapped_device *md, struct dm_table *t)
>>>  	if (err)
>>>  		goto out_kfree_tag_set;
>>>  
>>> -	q = blk_mq_init_allocated_queue(md->tag_set, md->queue);
>>> +	q = blk_mq_init_allocated_queue(md->tag_set, md->queue, true);
>>>  	if (IS_ERR(q)) {
>>>  		err = PTR_ERR(q);
>>>  		goto out_tag_set;
>>> diff --git a/include/linux/blk-mq.h b/include/linux/blk-mq.h
>>> index 62a3bb715899..0bf056de5cc3 100644
>>> --- a/include/linux/blk-mq.h
>>> +++ b/include/linux/blk-mq.h
>>> @@ -248,7 +248,8 @@ enum {
>>>  
>>>  struct request_queue *blk_mq_init_queue(struct blk_mq_tag_set *);
>>>  struct request_queue *blk_mq_init_allocated_queue(struct blk_mq_tag_set *set,
>>> -						  struct request_queue *q);
>>> +						  struct request_queue *q,
>>> +						  bool elevator_init);
>>>  struct request_queue *blk_mq_init_sq_queue(struct blk_mq_tag_set *set,
>>>  						const struct blk_mq_ops *ops,
>>>  						unsigned int queue_depth,
>>>
> 


-- 
Damien Le Moal
Western Digital Research

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
