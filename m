Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id C717A206B16
	for <lists+dm-devel@lfdr.de>; Wed, 24 Jun 2020 06:29:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1592972939;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=TTxWL7q0Ku3UGxTCVnen/4Nah3Xfrz2Nb4JSSf4yxYs=;
	b=hU5NqglDaa1Axkpx8L3dDyD6WoU4XCXAuIjwmDOkAj5enkhQIbiVsAzUlzxpPk5os67HfN
	MRBMB0TIOmQ8lZXTPmZzURDWfMx/vprke6/ua4MAv0T3aIizpvEw1qgAeuVONMxrmvvztW
	QhB1SCzwrSl8clGkd7LRQ0oMRatzYJ8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-96-bwk8WGluMLWHDi0OrDK1Bg-1; Wed, 24 Jun 2020 00:28:57 -0400
X-MC-Unique: bwk8WGluMLWHDi0OrDK1Bg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8BD2910059AB;
	Wed, 24 Jun 2020 04:28:50 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 516435DAA0;
	Wed, 24 Jun 2020 04:28:47 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 6291914CC1;
	Wed, 24 Jun 2020 04:28:36 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 05O4SNns013956 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 24 Jun 2020 00:28:23 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 59AA92157F24; Wed, 24 Jun 2020 04:28:23 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 53F57215671E
	for <dm-devel@redhat.com>; Wed, 24 Jun 2020 04:28:21 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4A660804205
	for <dm-devel@redhat.com>; Wed, 24 Jun 2020 04:28:21 +0000 (UTC)
Received: from esa6.hgst.iphmx.com (esa6.hgst.iphmx.com [216.71.154.45])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-325-irz_9yBuM8ymnjqa6C-S_A-1; Wed, 24 Jun 2020 00:28:18 -0400
X-MC-Unique: irz_9yBuM8ymnjqa6C-S_A-1
IronPort-SDR: 4/oVBLUMc8h6cN6JBXIY/nYQEYUn0k5abQHP+G7asWb07d2kapCxzNyiiJi74FT8dIUNpgZ8T+
	lc0rhyjZKjaBVgquVZHpR6lRV+N71q/aNS810fwVtuhDoqxLr44Oi/aQkEGyDTRM2klXTHY9TJ
	PdWNAteyG+qYX0kj7VlSDFiKP7O1Sevd4ENgA9wj2o8t8S35vUsIlbMNbXJQbBsPGhREyvaB7D
	xNIzu3yBCYyJtWtPgorl513umxVPy4cpIANuhSQ1EI/GTcytosV2waimqwsqg4C1Uwyu58G04Z
	03Q=
X-IronPort-AV: E=Sophos;i="5.75,273,1589212800"; d="scan'208";a="142138058"
Received: from mail-mw2nam12lp2045.outbound.protection.outlook.com (HELO
	NAM12-MW2-obe.outbound.protection.outlook.com) ([104.47.66.45])
	by ob1.hgst.iphmx.com with ESMTP; 24 Jun 2020 12:28:16 +0800
Received: from CY4PR04MB3751.namprd04.prod.outlook.com (2603:10b6:903:ec::14)
	by CY4PR04MB1030.namprd04.prod.outlook.com (2603:10b6:910:56::20)
	with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3109.24;
	Wed, 24 Jun 2020 04:28:14 +0000
Received: from CY4PR04MB3751.namprd04.prod.outlook.com
	([fe80::c593:f271:eebe:ac7]) by CY4PR04MB3751.namprd04.prod.outlook.com
	([fe80::c593:f271:eebe:ac7%9]) with mapi id 15.20.3109.023;
	Wed, 24 Jun 2020 04:28:14 +0000
From: Damien Le Moal <Damien.LeMoal@wdc.com>
To: Mike Snitzer <snitzer@redhat.com>
Thread-Topic: [RFC PATCH 0/1] dm-crypt excessive overhead
Thread-Index: AQHWSW85EuQz0D2EUU26/bqk/44H8Q==
Date: Wed, 24 Jun 2020 04:28:14 +0000
Message-ID: <CY4PR04MB37511A1673A58A2D66B4D6C0E7950@CY4PR04MB3751.namprd04.prod.outlook.com>
References: <20200619164132.1648-1-ignat@cloudflare.com>
	<20200619165548.GA24779@redhat.com>
	<CY4PR04MB3751F148CCFAAC99A7F05CF7E7970@CY4PR04MB3751.namprd04.prod.outlook.com>
	<20200623150118.GA19657@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [129.253.182.57]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 504bbfcc-c7ed-402b-256a-08d817f702cb
x-ms-traffictypediagnostic: CY4PR04MB1030:
x-microsoft-antispam-prvs: <CY4PR04MB10302435E8970154717297B8E7950@CY4PR04MB1030.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 0444EB1997
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: /3SseFRvk5fbYApAj8eUzgpucZTB5/oXLPAJfIDE/KfawWSWuyZSJoEezZJ77vgbYhG6X7F6Ko+6f+Bkuzx7M2xqa/ihx73p/r/yk9uurxc8ByTBYNGFmOmroMc/bIYmRzcf4NgMwiCXiM3yrT4dyoPiiIRv1FCcqzNsO/gs1dhRoimOgMlAnwZHBbfDb+JRWPgrXBQ3YWZOlgbVCGzLllxVmSFYMi/oDvFIIvQHZIDaxsyVJKXC8ei8e+Q1zr78i5tsTTie0CJNldgbZkgZcgZfLWQs2b8gBO/kbUIRfmqiInEZPzttM/PqGkFvxymr3er/S8/XHgIXosoYREQz8Qv7B99cYevx6bSrFJbD/zXjXax7+q+/eY6mpLB172pgw5VtCzA8a8M7PvB62il1ww==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
	IPV:NLI; SFV:NSPM; H:CY4PR04MB3751.namprd04.prod.outlook.com;
	PTR:; CAT:NONE; SFTY:;
	SFS:(4636009)(366004)(376002)(396003)(136003)(346002)(39860400002)(71200400001)(55016002)(2906002)(26005)(83380400001)(8936002)(33656002)(54906003)(9686003)(186003)(4326008)(8676002)(86362001)(52536014)(478600001)(7696005)(5660300002)(53546011)(66446008)(316002)(66556008)(64756008)(6506007)(66476007)(6916009)(966005)(76116006)(91956017)(66946007);
	DIR:OUT; SFP:1102;
x-ms-exchange-antispam-messagedata: VizTVj+oubBL1/gB3kkSECdh5Or756TGRp8BTliUmmbs5U5h5e3y9nMJYjXzyL17U4gX+3crsUEZxQ2wQpJRY2nj6n1pr0+S2+FBpeaH3Ip8oCsrK4dTHddT6vHze7aQPj4MUxRolBsei2K+sz6HVgYsn3Yj8XQb+T8evQh0azo9XBbrR1tITb4LuYUb5VTUajSTgnIVxm2eZNTqY9Er1B9SMkzzx/a65nEFGhU3aWL1iac8MdEGCXHNQlJgIwBR+Nn22BKZtSuvU+2RiJz4fbutAhLBbzXiF27aSUzhb2scEdUah3TfnwROvPfpA87xatTOagFdOwlUGy1iHX6J0ZKDRFI583TJCcdgf8c1SnaSCXsDTmKxek+5bQnnlun+o1QY7Y6vdPkoiewsza9JSYXNOP3hjTjs3TfhQw+YTacLxnldcS4QN8BsxbNrUyRh02vIL8su+wmKeLPG0xVJ4jYwHnAKWUPjNQ2Ge0ynmWBJFF9+jg62M9vozSZAXg3D
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 504bbfcc-c7ed-402b-256a-08d817f702cb
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Jun 2020 04:28:14.2874 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: SemFxYQceaJNNGEw+77b/vnbomVZT0V2O69dgksKjl7jqn2h8BWtyN/MpNQdaDdomxprVeGNas48MVP28G+LIQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR04MB1030
X-Mimecast-Bulk-Signature: yes
X-Mimecast-Spam-Signature: bulk
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 05O4SNns013956
X-loop: dm-devel@redhat.com
Cc: "kernel-team@cloudflare.com" <kernel-team@cloudflare.com>,
	"dm-crypt@saout.de" <dm-crypt@saout.de>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"dm-devel@redhat.com" <dm-devel@redhat.com>,
	Mikulas Patocka <mpatocka@redhat.com>,
	Ignat Korchagin <ignat@cloudflare.com>, "agk@redhat.com" <agk@redhat.com>
Subject: Re: [dm-devel] [RFC PATCH 0/1] dm-crypt excessive overhead
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
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 2020/06/24 0:01, Mike Snitzer wrote:
> On Sun, Jun 21 2020 at  8:45pm -0400,
> Damien Le Moal <Damien.LeMoal@wdc.com> wrote:
> 
>> On 2020/06/20 1:56, Mike Snitzer wrote:
>>> On Fri, Jun 19 2020 at 12:41pm -0400,
>>> Ignat Korchagin <ignat@cloudflare.com> wrote:
>>>
>>>> This is a follow up from the long-forgotten [1], but with some more convincing
>>>> evidence. Consider the following script:
>>>>
>>>> #!/bin/bash -e
>>>>
>>>> # create 4G ramdisk
>>>> sudo modprobe brd rd_nr=1 rd_size=4194304
>>>>
>>>> # create a dm-crypt device with NULL cipher on top of /dev/ram0
>>>> echo '0 8388608 crypt capi:ecb(cipher_null) - 0 /dev/ram0 0' | sudo dmsetup create eram0
>>>>
>>>> # create a dm-crypt device with NULL cipher and custom force_inline flag
>>>> echo '0 8388608 crypt capi:ecb(cipher_null) - 0 /dev/ram0 0 1 force_inline' | sudo dmsetup create inline-eram0
>>>>
>>>> # read all data from /dev/ram0
>>>> sudo dd if=/dev/ram0 bs=4k iflag=direct | sha256sum
>>>>
>>>> # read the same data from /dev/mapper/eram0
>>>> sudo dd if=/dev/mapper/eram0 bs=4k iflag=direct | sha256sum
>>>>
>>>> # read the same data from /dev/mapper/inline-eram0
>>>> sudo dd if=/dev/mapper/inline-eram0 bs=4k iflag=direct | sha256sum
>>>>
>>>> This script creates a ramdisk (to eliminate hardware bias in the benchmark) and
>>>> two dm-crypt instances on top. Both dm-crypt instances use the NULL cipher
>>>> to eliminate potentially expensive crypto bias (the NULL cipher just uses memcpy
>>>> for "encyption"). The first instance is the current dm-crypt implementation from
>>>> 5.8-rc1, the second is the dm-crypt instance with a custom new flag enabled from
>>>> the patch attached to this thread. On my VM (Debian in VirtualBox with 4 cores
>>>> on 2.8 GHz Quad-Core Intel Core i7) I get the following output (formatted for
>>>> better readability):
>>>>
>>>> # plain ram0
>>>> 1048576+0 records in
>>>> 1048576+0 records out
>>>> 4294967296 bytes (4.3 GB, 4.0 GiB) copied, 21.2305 s, 202 MB/s
>>>> 8479e43911dc45e89f934fe48d01297e16f51d17aa561d4d1c216b1ae0fcddca  -
>>>>
>>>> # eram0 (current dm-crypt)
>>>> 1048576+0 records in
>>>> 1048576+0 records out
>>>> 4294967296 bytes (4.3 GB, 4.0 GiB) copied, 53.2212 s, 80.7 MB/s
>>>> 8479e43911dc45e89f934fe48d01297e16f51d17aa561d4d1c216b1ae0fcddca  -
>>>>
>>>> # inline-eram0 (patched dm-crypt)
>>>> 1048576+0 records in
>>>> 1048576+0 records out
>>>> 4294967296 bytes (4.3 GB, 4.0 GiB) copied, 21.3472 s, 201 MB/s
>>>> 8479e43911dc45e89f934fe48d01297e16f51d17aa561d4d1c216b1ae0fcddca  -
>>>>
>>>> As we can see, current dm-crypt implementation creates a significant IO
>>>> performance overhead (at least on small IO block sizes) for both latency and
>>>> throughput. We suspect offloading IO request processing into workqueues and
>>>> async threads is more harmful these days with the modern fast storage. I also
>>>> did some digging into the dm-crypt git history and much of this async processing
>>>> is not needed anymore, because the reasons it was added are mostly gone from the
>>>> kernel. More details can be found in [2] (see "Git archeology" section).
>>>>
>>>> We have been running the attached patch on different hardware generations in
>>>> more than 200 datacentres on both SATA SSDs and NVME SSDs and so far were very
>>>> happy with the performance benefits.
>>>>
>>>> [1]: https://www.spinics.net/lists/dm-crypt/msg07516.html
>>>> [2]: https://blog.cloudflare.com/speeding-up-linux-disk-encryption/
>>>>
>>>> Ignat Korchagin (1):
>>>>   Add DM_CRYPT_FORCE_INLINE flag to dm-crypt target
>>>>
>>>>  drivers/md/dm-crypt.c | 55 +++++++++++++++++++++++++++++++++----------
>>>>  1 file changed, 43 insertions(+), 12 deletions(-)
>>>>
>>>> -- 
>>>> 2.20.1
>>>>
>>>
>>> Hi,
>>>
>>> I saw [2] and have been expecting something from cloudflare ever since.
>>> Nice to see this submission.
>>>
>>> There is useful context in your 0th patch header.  I'll likely merge
>>> parts of this patch header with the more terse 1/1 header (reality is
>>> there only needed to be a single patch submission).
>>>
>>> Will review and stage accordingly if all looks fine to me.  Mikulas,
>>> please have a look too.
>>
>> Very timely: I was about to send a couple of patches to add zoned block device
>> support to dm-crypt :)
>>
>> I used [1] work as a base to have all _write_ requests be processed inline in
>> the submitter context so that the submission order is preserved, avoiding the
>> potential reordering of sequential writes that the normal workqueue based
>> processing can generate. This inline processing is done only for writes. Reads
>> are unaffected.
>>
>> To do this, I added a "inline_io" flag to struct convert_context which is
>> initialized in crypt_io_init() based on the BIO op.
>> kcryptd_crypt_write_io_submit() then uses this flag to call directly
>> generic_make_request() if inline_io is true.
>>
>> This simplifies things compared to [1] since reads can still be processed as is,
>> so there are no issued with irq context and no need for a tasklet.
>>
>> Should I send these patches as RFC to see what can be merged ? Or I can wait for
>> these patches and rebase on top.
> 
> It'd be ideal for this inline capability to address both Ignat's and
> your needs.  Given Ignat's changes _should_ enable yours (and Ignat
> clarified that having reads inline is actually important) then I think it
> best if you review Ignat's patch closely, rebase on it and test that it
> meets your needs.

We did a lot of testing of the Cloudflare inline crypto patch to understand
implications on performance when using a server with a large population of
drives. These tests used regular drives, but we already understood while going
through this exercise that inline writes are an easy way to support SMR drives.
Point is: all the testing went well, no problem whatsoever detected. I will
review Ignat's patch.

> I'll wait for you to do this work so that I can get your feedback on
> whether Ignat's changes look good for you too.  We have some time before
> the 5.9 merge window opens, lets just keep the communication going and
> make sure what we send upstream addresses everyone's needs and concerns.

I based my work on the Ignat patch that was available on github. While that
patch was initially developped for 4.x kernels, it was easy to apply onto 5.8-rc
and I used this as a base. I ended up changing a lot of things because:
1) I did not needed the inline reads, but they can be if the user want them to
be for performance  reasons.
2) I micro-optimized writes to conventional zones, allowing those to not be
inline, inlining only writes targetting sequential zones. The benefits of this
optimization are rather dubious though (read: hard to measure) as conventional
zones represent generally about 1% of the drive total capacity, and the tendency
is to move toward SMR drives that only have sequential zones. Dropping this
optimization is fine. It simplifies things and adding SMR support is basically
reduced to adding the report zones method and marking dm-crypt features with
DM_TARGET_ZONED_HM. All on top of Ignat's patch.

Please see my following reply to Ignat's idea of separating read & write
inlining with 2 flags.

> 
> Thanks,
> Mike
> 
> 


-- 
Damien Le Moal
Western Digital Research



--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

