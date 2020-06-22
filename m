Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 12C93203184
	for <lists+dm-devel@lfdr.de>; Mon, 22 Jun 2020 10:09:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1592813359;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=eyPaWX8YcX58GVdbKe3zSAYNuxWQ+Fn4kzxUv03OazA=;
	b=KSjjxxl3oNmq+5NBhpEHt4ytCYYcSbS/wjwfyrg21BFfH802azaAbKH9ltjWowNVs+gHWg
	bJ3acQVRyZRzHW/2AqO7ONgEvyEtQHRdFLkaujJwLmoK+DAPFE8ySKFJD3UgvzQncBXwTo
	PcSC6JQi2Md2jYFvvIYI/zCfDCd50gI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-261-_54GuvD-PXqwc2jFmDJY2Q-1; Mon, 22 Jun 2020 04:09:16 -0400
X-MC-Unique: _54GuvD-PXqwc2jFmDJY2Q-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 63686800053;
	Mon, 22 Jun 2020 08:09:10 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id EC2365BAEA;
	Mon, 22 Jun 2020 08:09:08 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 019341809547;
	Mon, 22 Jun 2020 08:09:04 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 05M88u1N031464 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 22 Jun 2020 04:08:56 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 6250E2156A4F; Mon, 22 Jun 2020 08:08:56 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5C2BB2156A4D
	for <dm-devel@redhat.com>; Mon, 22 Jun 2020 08:08:54 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D7580108C267
	for <dm-devel@redhat.com>; Mon, 22 Jun 2020 08:08:53 +0000 (UTC)
Received: from esa4.hgst.iphmx.com (esa4.hgst.iphmx.com [216.71.154.42])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-101-zHGb9NpVNVi9VQ17Ko810w-1; Mon, 22 Jun 2020 04:08:51 -0400
X-MC-Unique: zHGb9NpVNVi9VQ17Ko810w-1
IronPort-SDR: u8ygO29TYXuetq9h3wpUUgi0DQGwz52khjs86EcXc1OIC9UBhhXpEff3qg66PcNlMN/ZAp0481
	BQRRTYvEmOqibXjlVo+ezWX1uCd4PMXeEEQMr1zu5TSh1ov8ChLsg7fvjyif3oDJbWShKjcZhP
	lUnWQ8LBjehLFwFh4MJFi46zQ/O14p/W2e+mWAB4GzmxYwXBRI4a8ZN8xIrh92Mvoq/t6J+Wgy
	QZsoptYd+MnTOyTItYafZs1aymLfSDU+EmO2CMe7zK7Z6qtER/8DDn9SdYk607MnMHZZsLSV4M
	Q18=
X-IronPort-AV: E=Sophos;i="5.75,266,1589212800"; d="scan'208";a="140591212"
Received: from mail-bn8nam11lp2177.outbound.protection.outlook.com (HELO
	NAM11-BN8-obe.outbound.protection.outlook.com) ([104.47.58.177])
	by ob1.hgst.iphmx.com with ESMTP; 22 Jun 2020 16:08:48 +0800
Received: from CY4PR04MB3751.namprd04.prod.outlook.com (2603:10b6:903:ec::14)
	by CY4PR04MB1032.namprd04.prod.outlook.com (2603:10b6:910:50::22)
	with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3109.24;
	Mon, 22 Jun 2020 08:08:47 +0000
Received: from CY4PR04MB3751.namprd04.prod.outlook.com
	([fe80::c593:f271:eebe:ac7]) by CY4PR04MB3751.namprd04.prod.outlook.com
	([fe80::c593:f271:eebe:ac7%9]) with mapi id 15.20.3109.023;
	Mon, 22 Jun 2020 08:08:47 +0000
From: Damien Le Moal <Damien.LeMoal@wdc.com>
To: Ignat Korchagin <ignat@cloudflare.com>
Thread-Topic: [dm-devel] [RFC PATCH 0/1] dm-crypt excessive overhead
Thread-Index: AQHWRlqI8D6+Lz65i0Kgr2YROVo4Vg==
Date: Mon, 22 Jun 2020 08:08:47 +0000
Message-ID: <CY4PR04MB3751563A036A92AD2837E0A8E7970@CY4PR04MB3751.namprd04.prod.outlook.com>
References: <20200619164132.1648-1-ignat@cloudflare.com>
	<20200619165548.GA24779@redhat.com>
	<CY4PR04MB3751F148CCFAAC99A7F05CF7E7970@CY4PR04MB3751.namprd04.prod.outlook.com>
	<CALrw=nFe2q5wn2LTA99yrFhZqGR9ehiqhEQqKFh44KmvTVF5gg@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [129.253.182.57]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 59b4313a-c265-49a7-6975-08d816837d74
x-ms-traffictypediagnostic: CY4PR04MB1032:
x-microsoft-antispam-prvs: <CY4PR04MB103253C169FDB1B8398BD85CE7970@CY4PR04MB1032.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:6790;
x-forefront-prvs: 0442E569BC
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: DI4SVq0j8KDnq1uaD1dAIftm/cbOjii86igZhagzzUUPdeQPcLjldzL/P1Ty9xSFs/xP0Il3pulJ/dOeHk/ZwTxA+RR2T2si7/JExAJTRq4teBa1LAnStIkvztavc92jz9xXJFk1k7k9zzXXhKG6C0DW5U9CiRcn1t+YEnxOrZSGUDjck9LkzDvg12VsX551Uw7Pd9SWzNriVhU/hC0gAey4fTp+wnwklRL2xkJab7KgbGGM7Nudzh0gXkDZWjDlN56cJhj2Owq9LsKEb4Ai9JxjYv/0xjqXBBPieWcmEFXIhlL4dQ1FAEO3H0drSGtKeMDJsml6Wsb4VkabeMmTJlQDsFbVL6JXRlU4rbhmQDCxLg2BjqFPn/wo6AfeizrS0K/chJqvFKQU8sxxjNNwjQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
	IPV:NLI; SFV:NSPM; H:CY4PR04MB3751.namprd04.prod.outlook.com;
	PTR:; CAT:NONE; SFTY:;
	SFS:(4636009)(136003)(366004)(346002)(39860400002)(376002)(396003)(66556008)(52536014)(71200400001)(64756008)(66446008)(966005)(54906003)(83380400001)(91956017)(8936002)(33656002)(7696005)(66946007)(86362001)(5660300002)(76116006)(6506007)(6916009)(186003)(316002)(4326008)(66476007)(2906002)(26005)(53546011)(55016002)(478600001)(9686003)(8676002);
	DIR:OUT; SFP:1102;
x-ms-exchange-antispam-messagedata: /Qzk28EyK+mayerb/6TKZPk2Aj7glG3xfvXwA2eIFugMeClXpRQUSpZMj2Wt5fOeqYgwWQzu5qBH8lEaIRcTTVDk2ZBhVpbF8+sYH8ArbcTAHjKzxS5Yvmrfs3pZh19cwXnDSg0CEJqR1ZV9I+jUEEmSF0urDCaUtTdyMRwMc0FxHDw7SKaVZ2Z/HpOFrpwPJFBXp3LMHu77n3islI7gDLE1tUBuqsU9WZ3zsNz9/+juaW/Xf5fitnh9vLA6UMakfGD1rl5laLNAp+wD3BQnm/1vjeww/4lHCp2XawPASDTqmJC+zZqWqXsWEi417UWuwQLOeQrVMEHQytpfV2WuFWTPWUoATrpLZrpefZOqasx5VMTMyAHNv1rOIJwZfPl9IKYlOsCcHO2p43MJmUPMX9MNyiIdCfbI8lP9MSN5McOVqk1KPxkh1B71Xo92ePD1jyNHgJ8bwddbH4P7Nn9DQPTcVwUiOLC1J9gjh6xY4OFIcMfPbApAgpHuogcf0JAn
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 59b4313a-c265-49a7-6975-08d816837d74
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Jun 2020 08:08:47.3243 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: cWJqJy5oL96rUhnZx/zVo6UD06NYROcN5xL+UVFs0aLR2bQK8hnvGIwxkaE2eG/ztrdEO5mer0r8LOjPtVKt1g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR04MB1032
X-Mimecast-Bulk-Signature: yes
X-Mimecast-Spam-Signature: bulk
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 05M88u1N031464
X-loop: dm-devel@redhat.com
Cc: Mike Snitzer <snitzer@redhat.com>,
	"kernel-team@cloudflare.com" <kernel-team@cloudflare.com>,
	"dm-crypt@saout.de" <dm-crypt@saout.de>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"dm-devel@redhat.com" <dm-devel@redhat.com>,
	Mikulas Patocka <mpatocka@redhat.com>, "agk@redhat.com" <agk@redhat.com>
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 2020/06/22 16:55, Ignat Korchagin wrote:
> On Mon, Jun 22, 2020 at 1:45 AM Damien Le Moal <Damien.LeMoal@wdc.com> wrote:
>>
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
> 
> In one of our major IO workflows (CDN cache) using dm-crypt created
> high and spiky p99 response times, which actually prompted this
> investigation. So, of all the things we do prefer the read path to be
> inlined even more than the write path.

Yes, I understand. Zoned block device support requires at the very least that
writes be inline to preserve order. For reads, inline or not are both fine. The
choice can be made by the user here using or not using the force inline flag you
are proposing. These works are definitely not incompatible. Doing everything
inline with a zoned block device backend is perfectly fine.

I mentioned my work because half of it is very similar to your patches. So we
could combine the patches, or as mentioned, one will have to rebase on top of
the other as clearly we will have conflicts :)

> 
>> Should I send these patches as RFC to see what can be merged ? Or I can wait for
>> these patches and rebase on top.
>>
>>>
>>> Thanks,
>>> Mike
>>>
>>> --
>>> dm-devel mailing list
>>> dm-devel@redhat.com
>>> https://www.redhat.com/mailman/listinfo/dm-devel
>>>
>>>
>>
>>
>> --
>> Damien Le Moal
>> Western Digital Research
> 


-- 
Damien Le Moal
Western Digital Research



--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

