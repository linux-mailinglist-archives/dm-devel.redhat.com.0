Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id A6D6E1CD1DD
	for <lists+dm-devel@lfdr.de>; Mon, 11 May 2020 08:32:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1589178726;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=2uhaIIPhkC0SU1kft/wWsUmtnxoIFRwyKhUVyuIhALs=;
	b=BtYsajQ9/6Ur7dnEIOsNyJvEQFSg+8YRFRskZoUKXduadCiDvX/T8WC8ESdIkmar92TrZp
	RMAQP5BGrtPZqdYno/MD6oBY8prcWmHgQZIYJQODtCXnCthKIVZCMcKXg7gvl96LNCo8EM
	FmooRCZUZi+/iL3wZAWzqZA3WmQKw14=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-206-AqDNXpcuNd-Pefy8aPnWng-1; Mon, 11 May 2020 02:32:02 -0400
X-MC-Unique: AqDNXpcuNd-Pefy8aPnWng-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C8BE3107ACF2;
	Mon, 11 May 2020 06:31:53 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C0D045D9DA;
	Mon, 11 May 2020 06:31:48 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 740654CAA0;
	Mon, 11 May 2020 06:31:37 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 04B6VMHN022326 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 11 May 2020 02:31:22 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id B328710EE77D; Mon, 11 May 2020 06:31:22 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id AF39A10EE77C
	for <dm-devel@redhat.com>; Mon, 11 May 2020 06:31:20 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2F4C5101A525
	for <dm-devel@redhat.com>; Mon, 11 May 2020 06:31:20 +0000 (UTC)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-22-IZHDP81INu25TG-DpTLBow-1;
	Mon, 11 May 2020 02:31:17 -0400
X-MC-Unique: IZHDP81INu25TG-DpTLBow-1
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
	by mx2.suse.de (Postfix) with ESMTP id CE448ABCE;
	Mon, 11 May 2020 06:31:17 +0000 (UTC)
To: Damien Le Moal <Damien.LeMoal@wdc.com>, Mike Snitzer <snitzer@redhat.com>
References: <20200508090332.40716-1-hare@suse.de>
	<BY5PR04MB6900138C0F78196D0F81BF07E7A10@BY5PR04MB6900.namprd04.prod.outlook.com>
From: Hannes Reinecke <hare@suse.de>
Message-ID: <1e68571f-0205-93c8-e535-a472c1a7b5d8@suse.de>
Date: Mon, 11 May 2020 08:31:12 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <BY5PR04MB6900138C0F78196D0F81BF07E7A10@BY5PR04MB6900.namprd04.prod.outlook.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 04B6VMHN022326
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=WINDOWS-1252; format=flowed
Content-Transfer-Encoding: quoted-printable

On 5/11/20 4:46 AM, Damien Le Moal wrote:
> On 2020/05/08 18:03, Hannes Reinecke wrote:
>> Hi all,
>>
>> this patchset adds a new metadata version 2 for dm-zoned, which brings t=
he
>> following improvements:
>>
>> - UUIDs and labels: Adding three more fields to the metadata containing
>>    the dm-zoned device UUID and label, and the device UUID. This allows
>>    for an unique identification of the devices, so that several dm-zoned
>>    sets can coexist and have a persistent identification.
>> - Extend random zones by an additional regular disk device: A regular
>>    block device can be added together with the zoned block device, provi=
ding
>>    additional (emulated) random write zones. With this it's possible to
>>    handle sequential zones only devices; also there will be a speed-up i=
f
>>    the regular block device resides on a fast medium. The regular block =
device
>>    is placed logically in front of the zoned block device, so that metad=
ata
>>    and mapping tables reside on the regular block device, not the zoned =
device.
>> - Tertiary superblock support: In addition to the two existing sets of m=
etadata
>>    another, tertiary, superblock is written to the first block of the zo=
ned
>>    block device. This superblock is for identification only; the generat=
ion
>>    number is set to '0' and the block itself it never updated. The addit=
ion
>>    metadate like bitmap tables etc are not copied.
>>
>> To handle this, some changes to the original handling are introduced:
>> - Zones are now equidistant. Originally, runt zones were ignored, and
>>    not counted when sizing the mapping tables. With the dual device setu=
p
>>    runt zones might occur at the end of the regular block device, making
>>    direct translation between zone number and sector/block number comple=
x.
>>    For metadata version 2 all zones are considered to be of the same siz=
e,
>>    and runt zones are simply marked as 'offline' to have them ignored wh=
en
>>    allocating a new zone.
>> - The block number in the superblock is now the global number, and refer=
s to
>>    the location of the superblock relative to the resulting device-mappe=
r
>>    device. Which means that the tertiary superblock contains absolute bl=
ock
>>    addresses, which needs to be translated to the relative device addres=
ses
>>    to find the referenced block.
>>
>> There is an accompanying patchset for dm-zoned-tools for writing and che=
cking
>> this new metadata.
>>
>> As usual, comments and reviews are welcome.
>=20
> I gave this series a good round of testing. See the attached picture for =
the
> results. The test is this:
> 1) Setup dm-zoned
> 2) Format and mount with mkfs.ext4 -E packed_meta_blocks=3D1 /dev/mapper/=
xxx
> 3) Create file random in size between 1 and 4MB and measure user seen thr=
oughput
> over 100 files.
> 3) Run that for 2 hours
>=20
> I ran this over a 15TB SMR drive single drive setup, and on the same driv=
e + a
> 500GB m.2 ssd added.
>=20
> For the single drive case, the usual 3 phases can be seen: start writing =
at
> about 110MB/s, everything going to conventional zones (note conv zones ar=
e in
> the middle of the disk, hence the low-ish throughput). Then after about 4=
00s,
> reclaim kicks in and the throughput drops to 60-70 MB/s. As reclaim canno=
t keep
> up under this heavy write workload, performance drops to 20-30MB/s after =
800s.
> All good, without any idle time for reclaim to do its job, this is all ex=
pected.
>=20
> For the dual drive case, things are more interesting:
> 1) The first phase is longer as overall, there is more conventional space=
 (500G
> ssd + 400G on SMR drive). So we see the SSD speed first (~425MB/s), then =
the
> drive speed (100 MB/s), slightly lower than the single drive case toward =
the end
> as reclaim triggers.
> 2) Some recovery back to ssd speed, then a long phase at half the speed o=
f the
> ssd as writes go to ssd and reclaim is running moving data out of the ssd=
 onto
> the disk.
> 3) Then a long phase at 25MB/s due to SMR disk reclaim.
> 4) back up to half the ssd speed.
>=20
> No crashes, no data corruption, all good. But is does look like we can im=
prove
> on performance further by preventing using the drive conventional zones a=
s
> "buffer" zones. If we let those be the final resting place of data, the S=
MR disk
> only reclaim would not kick in and hurt performance as seen here. That I =
think
> can all be done on top of this series though. Let's get this in first.
>=20
Thanks for the data! That indeed is very interesting; guess I'll do some=20
tests here on my setup, too.
(And hope it doesn't burn my NVDIMM ...)

But, guess what, I had the some thoughts; we should be treating the=20
random zones more like sequential zones in a two-disk setup.
So guess I'll be resurrecting the idea from my very first patch and=20
implement 'cache' zones in addition to the existing 'random' and=20
'sequential' zones.
But, as you said, that'll be a next series of patches.

What program did you use as a load generator?

Cheers,

Hannes
--=20
Dr. Hannes Reinecke            Teamlead Storage & Networking
hare@suse.de                               +49 911 74053 688
SUSE Software Solutions GmbH, Maxfeldstr. 5, 90409 N=FCrnberg
HRB 36809 (AG N=FCrnberg), Gesch=E4ftsf=FChrer: Felix Imend=F6rffer


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

