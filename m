Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id BD1A41CD1FB
	for <lists+dm-devel@lfdr.de>; Mon, 11 May 2020 08:41:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1589179300;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=8oN6PmOgC71IaDWU6HahFowUe6OPu8gSgOhLLSnXDDc=;
	b=ZfuNblb94Gz0O3g7UYjdtfZnKC742QdM+U/oRR8BCSvx/uXrbg+F5Y6bfuKCjQPFzCOu1n
	JZsdF2i7vujLxrT/c626CvvtGKUlDuZGGgkDucaINz+TVAoLHOAqDN0n2FwpboAJo4nOl/
	HFpmNAwOLB5M9WeQUHY6+fO23AbMZGk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-456-nLbvsDBlMlK_R37Io47crQ-1; Mon, 11 May 2020 02:41:38 -0400
X-MC-Unique: nLbvsDBlMlK_R37Io47crQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 31D461B18BC9;
	Mon, 11 May 2020 06:41:32 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 26CCB60CD1;
	Mon, 11 May 2020 06:41:30 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 232AC1809543;
	Mon, 11 May 2020 06:41:27 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 04B6fKTt023331 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 11 May 2020 02:41:21 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id BBBB02022ADE; Mon, 11 May 2020 06:41:20 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B691A2022ADD
	for <dm-devel@redhat.com>; Mon, 11 May 2020 06:41:18 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D92C4185A78B
	for <dm-devel@redhat.com>; Mon, 11 May 2020 06:41:17 +0000 (UTC)
Received: from esa1.hgst.iphmx.com (esa1.hgst.iphmx.com [68.232.141.245])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-109-xOgGsnkHOKSf6Dt7Ss3qWA-1; Mon, 11 May 2020 02:41:15 -0400
X-MC-Unique: xOgGsnkHOKSf6Dt7Ss3qWA-1
IronPort-SDR: yxf4huUoE0FPuPLN4+fvd3Td9uTxRt/1I9IxxIdQK+d+x2TbDDjXFJ3SVOQKYKNzPqyw8AG85a
	/UkOokMEgvUgxfh3rBXoj8MlatVkgxYhEVS0nBhyB6SYgJBxPuX9VHrCnCS2jwPHVCHnCwSR7C
	bmLPE8/P88jr5sVdP3w6K7TI6RKHnb+JaaBggD2nblbbNBPesncldliif32xlZ227t1qYoaT7c
	KJ8ecBBjt2kcm32ZGhNmC6BDNAdLXfFKxDZzKPKAoU1L6nIGrECZyZrb/20xHQq0E8A2VERoNW
	RRU=
X-IronPort-AV: E=Sophos;i="5.73,378,1583164800"; d="scan'208";a="246294934"
Received: from mail-mw2nam12lp2049.outbound.protection.outlook.com (HELO
	NAM12-MW2-obe.outbound.protection.outlook.com) ([104.47.66.49])
	by ob1.hgst.iphmx.com with ESMTP; 11 May 2020 14:41:14 +0800
Received: from BY5PR04MB6900.namprd04.prod.outlook.com (2603:10b6:a03:229::20)
	by BY5PR04MB6294.namprd04.prod.outlook.com (2603:10b6:a03:1e5::18)
	with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2979.34;
	Mon, 11 May 2020 06:41:12 +0000
Received: from BY5PR04MB6900.namprd04.prod.outlook.com
	([fe80::b574:3071:da2f:7606]) by
	BY5PR04MB6900.namprd04.prod.outlook.com
	([fe80::b574:3071:da2f:7606%6]) with mapi id 15.20.2979.033;
	Mon, 11 May 2020 06:41:12 +0000
From: Damien Le Moal <Damien.LeMoal@wdc.com>
To: Hannes Reinecke <hare@suse.de>, Mike Snitzer <snitzer@redhat.com>
Thread-Topic: [PATCHv5 00/14] dm-zoned: metadata version 2
Thread-Index: AQHWJRechFCM8ZarfEqHZb3tednc9w==
Date: Mon, 11 May 2020 06:41:12 +0000
Message-ID: <BY5PR04MB6900CDF593D730AFA8C9D31CE7A10@BY5PR04MB6900.namprd04.prod.outlook.com>
References: <20200508090332.40716-1-hare@suse.de>
	<BY5PR04MB6900138C0F78196D0F81BF07E7A10@BY5PR04MB6900.namprd04.prod.outlook.com>
	<1e68571f-0205-93c8-e535-a472c1a7b5d8@suse.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [129.253.182.57]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: c7554f69-43d0-472e-e9d3-08d7f5764be8
x-ms-traffictypediagnostic: BY5PR04MB6294:
x-microsoft-antispam-prvs: <BY5PR04MB629476D54612FE7C5D630DE9E7A10@BY5PR04MB6294.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:5236;
x-forefront-prvs: 04004D94E2
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: IAGe/IjouVx5cCWPaJhDok0kc8fSej4F2JqTf/VK2UOvSGuEfpFMaTYUFc9Cq5cgJsb8X+HJRWehoeuuwaHe8mM3P1U5E/9uSSuakFL0e/ZstI5qetqT3PL4I7NYNme/mYE2yFo6nmOssdwcaLyd8cJ9FAle/F//+1eMD/bgjEA0TpsXTApGng/e33a7qKa6AN+MXxFUMWdG74sm09H+ZL3cbNaPRTDypcwN8Yw+pCWH0+vX8iQdAPckrhNH3qa5JSCTNggj9RHsHak0NEdQ7tTVM4LBQdiDQ9N0262HFvclFavubpYmU7P5fSjiEcnkQU6bm6EjtA9OVHo7M9cJ92bEHakmBRGU/aQJvJhLL0jDwgZ4g48IZRGurFwdPTjTK2Ez1dsaMMhu+db00fmrnT/OfY2R4CZ/Xef/FClgZ4Jrb+swlXuVf48NBy/6AFJDE653+RcFS3tbt4x9nBVlg5WxZeNl4CTTxDJ6uXzuI3Nuqb8rUF8BOlizjBYgY+ld4l+EpII6+LfIBy7g2QkVtBsFDLonDmwqxrt85y/PKf+vH2mBvg+MYJXWkq+4xeU0
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
	IPV:NLI; SFV:NSPM; H:BY5PR04MB6900.namprd04.prod.outlook.com;
	PTR:; CAT:NONE; SFTY:;
	SFS:(4636009)(136003)(396003)(366004)(39860400002)(346002)(376002)(33430700001)(186003)(86362001)(76116006)(8936002)(66476007)(66556008)(64756008)(66446008)(8676002)(5660300002)(2906002)(71200400001)(478600001)(110136005)(54906003)(66946007)(316002)(33440700001)(6506007)(26005)(53546011)(33656002)(52536014)(9686003)(7696005)(4326008)(55016002)(21314003);
	DIR:OUT; SFP:1102;
x-ms-exchange-antispam-messagedata: xI62A9bUmUoFINfjZhqgPAGuZ7flS/UAfvBDXd7gSACNiRmCuFGompoH3gVnRoOc19xtoaWmSvJu4+Hr2Zyg49d01amTeSQ305rTBLbzNbGHBRB+dakN+igBo3pRpegPixpbPlAruSxJfhXfmuiPEYZ3Gi/gbIOoF5h+2+6stvBeKJ+8mtSAE+EWmKDUUloi7WDzfsfIC/CTJdwC5wV2lzpQmdQO2Bw/KZqB8QYrY7FofKD6n8RuIeesRE+BQrMijaV+HguR/e72uG5U6lEkoGHVRN0/5UdRh6d2eBRiBtJNw7Tr3IXRpjsijV04Hj1v6VCVKhlmTQ21JbS7PqX82Idm2e6VY0LCE1hZ4h0VTMAyxsr6iwFKXO9I43yRhWcfzShNDbT+DLV7TUT9GIOIEZzcu4Pl6ip2OGoM5wJYQx7gIguDEZ5ZntWg9zLSKpYgEf0q+w+gNw640BCJwQEjw5HRSNsBkIpUTG3nrPHeaB8pK5t9MkN9CBy0U95dzZfM
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c7554f69-43d0-472e-e9d3-08d7f5764be8
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 May 2020 06:41:12.2913 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ck0KKi8n7XdzKfd32g1czRN9O59p5+kRwk3SCDuikF36wXlglGKMPfOYqU9u1EH6+G0ss6VDCx+n4H6m0ShcLg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR04MB6294
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 04B6fKTt023331
X-loop: dm-devel@redhat.com
Cc: Bob Liu <bob.liu@oracle.com>, "dm-devel@redhat.com" <dm-devel@redhat.com>
Subject: Re: [dm-devel] [PATCHv5 00/14] dm-zoned: metadata version 2
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
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 2020/05/11 15:31, Hannes Reinecke wrote:
> On 5/11/20 4:46 AM, Damien Le Moal wrote:
>> On 2020/05/08 18:03, Hannes Reinecke wrote:
>>> Hi all,
>>>
>>> this patchset adds a new metadata version 2 for dm-zoned, which brings the
>>> following improvements:
>>>
>>> - UUIDs and labels: Adding three more fields to the metadata containing
>>>    the dm-zoned device UUID and label, and the device UUID. This allows
>>>    for an unique identification of the devices, so that several dm-zoned
>>>    sets can coexist and have a persistent identification.
>>> - Extend random zones by an additional regular disk device: A regular
>>>    block device can be added together with the zoned block device, providing
>>>    additional (emulated) random write zones. With this it's possible to
>>>    handle sequential zones only devices; also there will be a speed-up if
>>>    the regular block device resides on a fast medium. The regular block device
>>>    is placed logically in front of the zoned block device, so that metadata
>>>    and mapping tables reside on the regular block device, not the zoned device.
>>> - Tertiary superblock support: In addition to the two existing sets of metadata
>>>    another, tertiary, superblock is written to the first block of the zoned
>>>    block device. This superblock is for identification only; the generation
>>>    number is set to '0' and the block itself it never updated. The addition
>>>    metadate like bitmap tables etc are not copied.
>>>
>>> To handle this, some changes to the original handling are introduced:
>>> - Zones are now equidistant. Originally, runt zones were ignored, and
>>>    not counted when sizing the mapping tables. With the dual device setup
>>>    runt zones might occur at the end of the regular block device, making
>>>    direct translation between zone number and sector/block number complex.
>>>    For metadata version 2 all zones are considered to be of the same size,
>>>    and runt zones are simply marked as 'offline' to have them ignored when
>>>    allocating a new zone.
>>> - The block number in the superblock is now the global number, and refers to
>>>    the location of the superblock relative to the resulting device-mapper
>>>    device. Which means that the tertiary superblock contains absolute block
>>>    addresses, which needs to be translated to the relative device addresses
>>>    to find the referenced block.
>>>
>>> There is an accompanying patchset for dm-zoned-tools for writing and checking
>>> this new metadata.
>>>
>>> As usual, comments and reviews are welcome.
>>
>> I gave this series a good round of testing. See the attached picture for the
>> results. The test is this:
>> 1) Setup dm-zoned
>> 2) Format and mount with mkfs.ext4 -E packed_meta_blocks=1 /dev/mapper/xxx
>> 3) Create file random in size between 1 and 4MB and measure user seen throughput
>> over 100 files.
>> 3) Run that for 2 hours
>>
>> I ran this over a 15TB SMR drive single drive setup, and on the same drive + a
>> 500GB m.2 ssd added.
>>
>> For the single drive case, the usual 3 phases can be seen: start writing at
>> about 110MB/s, everything going to conventional zones (note conv zones are in
>> the middle of the disk, hence the low-ish throughput). Then after about 400s,
>> reclaim kicks in and the throughput drops to 60-70 MB/s. As reclaim cannot keep
>> up under this heavy write workload, performance drops to 20-30MB/s after 800s.
>> All good, without any idle time for reclaim to do its job, this is all expected.
>>
>> For the dual drive case, things are more interesting:
>> 1) The first phase is longer as overall, there is more conventional space (500G
>> ssd + 400G on SMR drive). So we see the SSD speed first (~425MB/s), then the
>> drive speed (100 MB/s), slightly lower than the single drive case toward the end
>> as reclaim triggers.
>> 2) Some recovery back to ssd speed, then a long phase at half the speed of the
>> ssd as writes go to ssd and reclaim is running moving data out of the ssd onto
>> the disk.
>> 3) Then a long phase at 25MB/s due to SMR disk reclaim.
>> 4) back up to half the ssd speed.
>>
>> No crashes, no data corruption, all good. But is does look like we can improve
>> on performance further by preventing using the drive conventional zones as
>> "buffer" zones. If we let those be the final resting place of data, the SMR disk
>> only reclaim would not kick in and hurt performance as seen here. That I think
>> can all be done on top of this series though. Let's get this in first.
>>
> Thanks for the data! That indeed is very interesting; guess I'll do some 
> tests here on my setup, too.
> (And hope it doesn't burn my NVDIMM ...)
> 
> But, guess what, I had the some thoughts; we should be treating the 
> random zones more like sequential zones in a two-disk setup.
> So guess I'll be resurrecting the idea from my very first patch and 
> implement 'cache' zones in addition to the existing 'random' and 
> 'sequential' zones.
> But, as you said, that'll be a next series of patches.
> 
> What program did you use as a load generator?

My own "filebench" program :)
It it just a simple tool that write files using some thread, IO size, IO type,
sync or not, fsync or not, etc. Various parameters possible. The same can be
done with fio.

The parameters I used are:
- random (uniform distribution) file size between 1MiB and 4 MiB
- Files written using buffered IOs with 4K writes (I know ! just trying to be
nasty to dm-zoned)
- 20 writer threads each writing 10 files: each data point is the bandwidth of
those 20 threads/200 files being written (above I said 100 files... My bad. It
is 200).
- For each data point, create a new directory to not end up with super large
directories slowing down the FS



-- 
Damien Le Moal
Western Digital Research



--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

