Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id 43EFC13A8BF
	for <lists+dm-devel@lfdr.de>; Tue, 14 Jan 2020 12:55:53 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1579002951;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=tNSFCVSa/yDD1BFc8m5T+GlAoHdwaGuDC3+T6I/Y3GY=;
	b=gVUSnKyJ7+zhrdzyax4QLmRJMp3ftU1KoWhzCGOi3XGBiq2Wy6GyLLvW1O7MpVjUt2tpRP
	6Cd0xpHxnz/4dRrM2IHmOLI18Aw8p4gDQi2NPCNFNQppNK2nQN5ezS75ZKjDlbT+OLbKJg
	0CerdHrka4qVFUpu4Rcf307Jz3H1MyI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-318-XwiJmMEINRSoVkfoNdM98A-1; Tue, 14 Jan 2020 06:55:49 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9E26B100551B;
	Tue, 14 Jan 2020 11:55:43 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 24D6982E5E;
	Tue, 14 Jan 2020 11:55:43 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id B9E781803C33;
	Tue, 14 Jan 2020 11:55:42 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 00DK35MD009075 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 13 Jan 2020 15:03:05 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 28DA4202A943; Mon, 13 Jan 2020 20:03:05 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 22F562026D69
	for <dm-devel@redhat.com>; Mon, 13 Jan 2020 20:03:02 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B9310802822
	for <dm-devel@redhat.com>; Mon, 13 Jan 2020 20:03:02 +0000 (UTC)
Received: from gateway24.websitewelcome.com (gateway24.websitewelcome.com
	[192.185.50.66]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-204-l13B1V8SN_i4YKSUJbWXLA-1; Mon, 13 Jan 2020 15:02:58 -0500
Received: from cm16.websitewelcome.com (cm16.websitewelcome.com [100.42.49.19])
	by gateway24.websitewelcome.com (Postfix) with ESMTP id 94E2821BF5
	for <dm-devel@redhat.com>; Mon, 13 Jan 2020 14:02:57 -0600 (CST)
Received: from host2059.hostmonster.com ([67.20.112.233]) by cmsmtp with SMTP
	id r5vNiU7Em32Adr5vNifLaN; Mon, 13 Jan 2020 14:02:57 -0600
X-Authority-Reason: nr=8
Received: from [196.157.140.70] (port=15475 helo=[192.168.100.109])
	by host2059.hostmonster.com with esmtpsa
	(TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92)
	(envelope-from <mmokhtar@petasan.org>)
	id 1ir5vM-000jJA-8g; Mon, 13 Jan 2020 13:02:56 -0700
To: Mikulas Patocka <mpatocka@redhat.com>
References: <598c7c64-9b11-3407-2060-8d43b1ef1241@petasan.org>
	<d76f7245-034c-f225-00fe-f33c5e9abf1a@petasan.org>
	<alpine.LRH.2.02.2001021144450.18253@file01.intranet.prod.int.rdu2.redhat.com>
From: Maged Mokhtar <mmokhtar@petasan.org>
Message-ID: <a858b409-d3d5-b439-5f15-563fb5316d2a@petasan.org>
Date: Mon, 13 Jan 2020 22:02:52 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <alpine.LRH.2.02.2001021144450.18253@file01.intranet.prod.int.rdu2.redhat.com>
Content-Language: en-US
X-AntiAbuse: This header was added to track abuse,
	please include it with any abuse report
X-AntiAbuse: Primary Hostname - host2059.hostmonster.com
X-AntiAbuse: Original Domain - redhat.com
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - petasan.org
X-BWhitelist: no
X-Source-IP: 196.157.140.70
X-Source-L: No
X-Exim-ID: 1ir5vM-000jJA-8g
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: ([192.168.100.109]) [196.157.140.70]:15475
X-Source-Auth: mmokhtar@petasan.org
X-Email-Count: 2
X-Source-Cap: cGV0YXNhbm87cGV0YXNhbm87aG9zdDIwNTkuaG9zdG1vbnN0ZXIuY29t
X-Local-Domain: yes
X-MC-Unique: l13B1V8SN_i4YKSUJbWXLA-1
X-MC-Unique: XwiJmMEINRSoVkfoNdM98A-1
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 00DK35MD009075
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Tue, 14 Jan 2020 06:55:09 -0500
Cc: dm-devel@redhat.com, Mike Snitzer <msnitzer@redhat.com>
Subject: Re: [dm-devel] [PATCH] dm writecache: SB remove seq_count
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
Content-Type: text/plain; charset="iso-8859-15"; Format="flowed"
Content-Transfer-Encoding: quoted-printable



> Hi
>=20
>=20
> On Thu, 2 Jan 2020, Maged Mokhtar wrote:
>=20
>> Any feedback on this patch please.
>=20
> This will definitely not work for persistent memory - it could corrupt
> data if a crash happens. The CPU can flush data in arbitrary order and it
> may happen that the seq count is flushed before the pertaining data.
>=20
> As for SSD mode - we could avoid updating the refcount in the superblock,
> but it wouldn't be much helpful.
>=20
> I.e. normally, commit is done this way:
> 1. submit data writes
> 2. submit metadata writes
> 3. flush disk cache
> 4. submit the write of superblock with increased seq_count
> 5. flush disk cache
>=20
> If we wanted to avoid writing the seq_count, we would need to change it
> to:
> 1. submit data writes
> 2. flush disk cache
> 3. submit metadata writes
> 4. flush disk cache
>=20
> - i.e. it sill needs two disk cache flushes per one commit request - and
> it is not much better than the existing solution.
>=20
> Mikulas
>=20


Hi Mikulas,

I appreciate your review. For SSD mode, I see the advantages of SB=20
writes for handling crash recovery and agree with what you say. Note=20
however that after a crash a proper client should not assume the data is=20
valid on a device, only at the point it last issued a successful flush=20
should the data be consistent, after this it should not assume so. A=20
filesystem/db should handle journals/transaction at a higher level than=20
the device. But again anything we can do on the device/target to make=20
things more consistent, the better, so i agree there.

There is also limit to what the current crash recovery code can do, as i=20
understand it if you have metadata already committed, their seq count is=20
not incremented for new io on the same blocks, the crash recovery code=20
will therefore not detect or recover cases where new data is written to=20
existing 4k blocks at the time of crash, some blocks will end up with=20
new data, others will not. Again this is my understanding so i could be=20
wrong.

I think if crash consistency needs to be enhanced, it should take into=20
account that most consumer/non-enterprise SSDs do not offer power loss=20
protection. For many such devices power loss can corrupt data that is=20
already written as they commit data in larger chunks via a=20
read/modify/erase/write cycle. It is particularly bad for metadata as it=20
could affect many data blocks. Maybe it could be good to have metadata=20
writes via transactions or journaling, dm-cache and thin provisioning do=20
something like this i think.

i also think your suggestion of:
 > If we wanted to avoid writing the seq_count, we would need to change it
 > to:
 > 1. submit data writes
 > 2. flush disk cache
 > 3. submit metadata writes
 > 4. flush disk cache

could be better in terms of prolonging SSD lifetime, as currently the=20
superblock gets much higher write frequency.

/Maged




>> On 06/12/2019 21:03, Maged Mokhtar wrote:
>>> Removes seq_count from super block. Currently the super block gets writ=
ten
>>> in each commit to update the seq_count which is just used when the targ=
et is
>>> restarted/resumed. This extra iop has a performance impact on small blo=
ck
>>> size writes which do FUA/sync on every request. A 4k sync write current=
ly
>>> requires 3 write ops: submitted data, metadata + super block seq_count
>>> update, removal of seq_count update reduces required write ops to 2.
>>>
>>> Rebuild of seq_count at start/resumption can be done quickly by looping
>>> through memory entry metadata within the resume() function.
>>>
>>> Signed-off-by: Maged Mokhtar <mmokhtar@petasan.org>
>>> ---
>>>   =A0drivers/md/dm-writecache.c |=A0=A0 56 ++++++++++++++++++++++++++--=
-------
>>>   =A01 file changed, 42 insertions(+), 14 deletions(-)
>>>
>>> --- a/drivers/md/dm-writecache.c=A0=A0=A0 2019-12-06 03:07:53.000000000=
 -0800
>>> +++ b/drivers/md/dm-writecache.c=A0=A0=A0 2019-12-06 09:25:45.000000000=
 -0800
>>> @@ -52,7 +52,8 @@ do {=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 \
>>>   =A0#endif
>>>
>>>   =A0#define MEMORY_SUPERBLOCK_MAGIC=A0=A0=A0=A0=A0=A0=A0 0x23489321
>>> -#define MEMORY_SUPERBLOCK_VERSION=A0=A0=A0 1
>>> +#define MEMORY_SUPERBLOCK_VERSION_1=A0=A0=A0 1
>>> +#define MEMORY_SUPERBLOCK_VERSION_2=A0=A0=A0 2
>>>
>>>   =A0struct wc_memory_entry {
>>>   =A0=A0=A0=A0 __le64 original_sector;
>>> @@ -67,7 +68,6 @@ struct wc_memory_superblock {
>>>   =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 __le32 block_size;
>>>   =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 __le32 pad;
>>>   =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 __le64 n_blocks;
>>> -=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 __le64 seq_count;
>>>   =A0=A0=A0=A0=A0=A0=A0=A0 };
>>>   =A0=A0=A0=A0=A0=A0=A0=A0 __le64 padding[8];
>>>   =A0=A0=A0=A0 };
>>> @@ -380,6 +380,41 @@ static uint64_t read_seq_count(struct dm
>>>   =A0#endif
>>>   =A0}
>>>
>>> +static uint64_t read_last_seq_count(struct dm_writecache *wc)
>>> +{
>>> +=A0=A0=A0 size_t b;
>>> +=A0=A0=A0 uint64_t last_seq_count =3D 0;
>>> +=A0=A0=A0 uint64_t seq_count;
>>> +=A0=A0=A0 __le64 empty =3D cpu_to_le64(-1);
>>> +
>>> +=A0=A0=A0 if (WC_MODE_PMEM(wc)) {
>>> +=A0=A0=A0=A0=A0=A0=A0 struct wc_memory_entry wme;
>>> +=A0=A0=A0=A0=A0=A0=A0 for (b =3D 0; b < wc->n_blocks; b++) {
>>> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 BUG_ON(memcpy_mcsafe(&wme, &sb(wc)->=
entries[b],
>>> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 sizeof(struct wc_memory_=
entry)));
>>> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 if (wme.seq_count !=3D empty) {
>>> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 seq_count =3D le64_to_cp=
u(wme.seq_count);
>>> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 if (last_seq_count < seq=
_count)
>>> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 last_seq_cou=
nt =3D seq_count;
>>> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 }
>>> +=A0=A0=A0=A0=A0=A0=A0 }
>>> +=A0=A0=A0 }
>>> +=A0=A0=A0 else {
>>> +=A0=A0=A0=A0=A0=A0=A0 struct wc_memory_entry *p =3D &sb(wc)->entries[0=
];
>>> +=A0=A0=A0=A0=A0=A0=A0 b =3D wc->n_blocks;
>>> +=A0=A0=A0=A0=A0=A0=A0 while (0 < b) {
>>> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 if (p->seq_count !=3D empty) {
>>> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 seq_count =3D le64_to_cp=
u(p->seq_count);
>>> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 if (last_seq_count < seq=
_count)
>>> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 last_seq_cou=
nt =3D seq_count;
>>> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 }
>>> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 p++;
>>> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 b--;
>>> +=A0=A0=A0=A0=A0=A0=A0 }
>>> +=A0=A0=A0 }
>>> +=A0=A0=A0 return last_seq_count;
>>> +}
>>> +
>>>   =A0static void clear_seq_count(struct dm_writecache *wc, struct wc_en=
try *e)
>>>   =A0{
>>>   =A0#ifdef DM_WRITECACHE_HANDLE_HARDWARE_ERRORS
>>> @@ -730,8 +765,6 @@ static void writecache_flush(struct dm_w
>>>   =A0=A0=A0=A0=A0=A0=A0=A0 writecache_wait_for_ios(wc, WRITE);
>>>
>>>   =A0=A0=A0=A0 wc->seq_count++;
>>> -=A0=A0=A0 pmem_assign(sb(wc)->seq_count, cpu_to_le64(wc->seq_count));
>>> -=A0=A0=A0 writecache_flush_region(wc, &sb(wc)->seq_count, sizeof
>>> sb(wc)->seq_count);
>>>   =A0=A0=A0=A0 writecache_commit_flushed(wc);
>>>
>>>   =A0=A0=A0=A0 wc->overwrote_committed =3D false;
>>> @@ -876,7 +909,6 @@ static void writecache_resume(struct dm_
>>>   =A0=A0=A0=A0 struct dm_writecache *wc =3D ti->private;
>>>   =A0=A0=A0=A0 size_t b;
>>>   =A0=A0=A0=A0 bool need_flush =3D false;
>>> -=A0=A0=A0 __le64 sb_seq_count;
>>>   =A0=A0=A0=A0 int r;
>>>
>>>   =A0=A0=A0=A0 wc_lock(wc);
>>> @@ -894,12 +926,7 @@ static void writecache_resume(struct dm_
>>>   =A0=A0=A0=A0 }
>>>   =A0=A0=A0=A0 wc->freelist_size =3D 0;
>>>
>>> -=A0=A0=A0 r =3D memcpy_mcsafe(&sb_seq_count, &sb(wc)->seq_count, sizeo=
f(uint64_t));
>>> -=A0=A0=A0 if (r) {
>>> -=A0=A0=A0=A0=A0=A0=A0 writecache_error(wc, r, "hardware memory error w=
hen reading
>>> superblock: %d", r);
>>> -=A0=A0=A0=A0=A0=A0=A0 sb_seq_count =3D cpu_to_le64(0);
>>> -=A0=A0=A0 }
>>> -=A0=A0=A0 wc->seq_count =3D le64_to_cpu(sb_seq_count);
>>> +=A0=A0=A0 wc->seq_count =3D read_last_seq_count(wc) + 1;
>>>
>>>   =A0#ifdef DM_WRITECACHE_HANDLE_HARDWARE_ERRORS
>>>   =A0=A0=A0=A0 for (b =3D 0; b < wc->n_blocks; b++) {
>>> @@ -1757,10 +1784,9 @@ static int init_memory(struct dm_writeca
>>>
>>>   =A0=A0=A0=A0 for (b =3D 0; b < ARRAY_SIZE(sb(wc)->padding); b++)
>>>   =A0=A0=A0=A0=A0=A0=A0=A0 pmem_assign(sb(wc)->padding[b], cpu_to_le64(=
0));
>>> -=A0=A0=A0 pmem_assign(sb(wc)->version, cpu_to_le32(MEMORY_SUPERBLOCK_V=
ERSION));
>>> +=A0=A0=A0 pmem_assign(sb(wc)->version, cpu_to_le32(MEMORY_SUPERBLOCK_V=
ERSION_2));
>>>   =A0=A0=A0=A0 pmem_assign(sb(wc)->block_size, cpu_to_le32(wc->block_si=
ze));
>>>   =A0=A0=A0=A0 pmem_assign(sb(wc)->n_blocks, cpu_to_le64(wc->n_blocks))=
;
>>> -=A0=A0=A0 pmem_assign(sb(wc)->seq_count, cpu_to_le64(0));
>>>
>>>   =A0=A0=A0=A0 for (b =3D 0; b < wc->n_blocks; b++)
>>>   =A0=A0=A0=A0=A0=A0=A0=A0 write_original_sector_seq_count(wc, &wc->ent=
ries[b], -1, -1);
>>> @@ -2159,11 +2185,13 @@ invalid_optional:
>>>   =A0=A0=A0=A0=A0=A0=A0=A0 goto bad;
>>>   =A0=A0=A0=A0 }
>>>
>>> -=A0=A0=A0 if (le32_to_cpu(s.version) !=3D MEMORY_SUPERBLOCK_VERSION) {
>>> +=A0=A0=A0 if (le32_to_cpu(s.version) !=3D MEMORY_SUPERBLOCK_VERSION_1 =
&&
>>> +=A0=A0=A0=A0=A0=A0=A0 le32_to_cpu(s.version) !=3D MEMORY_SUPERBLOCK_VE=
RSION_2) {
>>>   =A0=A0=A0=A0=A0=A0=A0=A0 ti->error =3D "Invalid version in the superb=
lock";
>>>   =A0=A0=A0=A0=A0=A0=A0=A0 r =3D -EINVAL;
>>>   =A0=A0=A0=A0=A0=A0=A0=A0 goto bad;
>>>   =A0=A0=A0=A0 }
>>> +=A0=A0=A0 pmem_assign(sb(wc)->version, cpu_to_le32(MEMORY_SUPERBLOCK_V=
ERSION_2));
>>>
>>>   =A0=A0=A0=A0 if (le32_to_cpu(s.block_size) !=3D wc->block_size) {
>>>   =A0=A0=A0=A0=A0=A0=A0=A0 ti->error =3D "Block size does not match sup=
erblock";
>>
>> --=20


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

