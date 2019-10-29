Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id 2A970E8AA8
	for <lists+dm-devel@lfdr.de>; Tue, 29 Oct 2019 15:22:05 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1572358923;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=kkgq12eGrO/aRxRm/pyo+uOMUIBQ7+nl1Q9P190I6yU=;
	b=gZRt5qJWf3h11ld5IpAFT27ws/amnMYfMHzVhT8x6XwwGyWM4ZcXRkShj99SVYcqFxQq19
	e4geplkFjhnGDGh1otuiOySKaxyXHlRNarajEsYnSTC9pO54OO3+aCJGkE9VV1CRG5vfZH
	TI5DDoV6J5gsCPW/pdD1UUymhQ46Z9M=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-118-pC-0H0qQP-23wDPIHLLssQ-1; Tue, 29 Oct 2019 10:22:01 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9CF82180496F;
	Tue, 29 Oct 2019 14:21:54 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id ABE8B5D6C3;
	Tue, 29 Oct 2019 14:21:48 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 5B01A182B00E;
	Tue, 29 Oct 2019 14:21:37 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x9TELK0h014190 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 29 Oct 2019 10:21:20 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 431375D9DC; Tue, 29 Oct 2019 14:21:20 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from file01.intranet.prod.int.rdu2.redhat.com
	(file01.intranet.prod.int.rdu2.redhat.com [10.11.5.7])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id BF9545DA5B;
	Tue, 29 Oct 2019 14:21:15 +0000 (UTC)
Received: from file01.intranet.prod.int.rdu2.redhat.com (localhost [127.0.0.1])
	by file01.intranet.prod.int.rdu2.redhat.com (8.14.4/8.14.4) with ESMTP
	id x9TELFaF028772; Tue, 29 Oct 2019 10:21:15 -0400
Received: from localhost (mpatocka@localhost)
	by file01.intranet.prod.int.rdu2.redhat.com (8.14.4/8.14.4/Submit) with
	ESMTP id x9TELEH7028768; Tue, 29 Oct 2019 10:21:14 -0400
X-Authentication-Warning: file01.intranet.prod.int.rdu2.redhat.com: mpatocka
	owned process doing -bs
Date: Tue, 29 Oct 2019 10:21:14 -0400 (EDT)
From: Mikulas Patocka <mpatocka@redhat.com>
X-X-Sender: mpatocka@file01.intranet.prod.int.rdu2.redhat.com
To: Alessio Balsini <balsini@android.com>
In-Reply-To: <20191025101624.GA61225@google.com>
Message-ID: <alpine.LRH.2.02.1910290957220.25731@file01.intranet.prod.int.rdu2.redhat.com>
References: <20191025101624.GA61225@google.com>
User-Agent: Alpine 2.02 (LRH 1266 2009-07-14)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-loop: dm-devel@redhat.com
Cc: Jens Axboe <axboe@kernel.dk>, linux-block@vger.kernel.org,
	linux-kernel@vger.kernel.org, elsk@google.com,
	dm-devel@redhat.com, dvander@google.com, kernel-team@android.com,
	Alasdair G Kergon <agk@redhat.com>
Subject: Re: [dm-devel] dm-snapshot for system updates in Android
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
X-MC-Unique: pC-0H0qQP-23wDPIHLLssQ-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable

Hi

On Fri, 25 Oct 2019, Alessio Balsini wrote:

> Hello everyone!
>=20
> I hope you will appreciate knowing that we are currently evaluating the u=
se of
> dm-snapshot to implement a mechanism to obtain revertible, space-efficien=
t
> system upgrades in Android.  More specifically, we are using
> dm-snapshot-persistent to test the updated device after reboot, then issu=
e a
> merge in case of success, otherwise, destroy the snapshot.
> This new update mechanism is still under evaluation, but its development =
is
> openly done in AOSP.
>=20
> At the current stage, we have a prototype we are happy with, both in term=
s of
> space consumption overhead (for the COW device) and benchmarking results =
for
> read-write and merge operations.
>=20
> I would be glad if you could provide some feedback on a few points that I=
 don't
> have completely clear.
>=20
>=20
> -- Interface stability
>=20
> To obtain an initial, empty COW device as quick as possible, we force to =
0 only
> its first 32 bit (magic field). This solution looks clear from the kernel=
 code,
> but can we rely on that for all the kernels with SNAPSHOT_DISK_VERSION =
=3D=3D 1?

It will work, but, to be consistent with lvm, I suggest to overwrite the=20
first 4k with zeroes.

> Would you appreciate it if a similar statement is added as part of
> /Documentation, making this solution more stable? Or maybe I can think of
> adding an initialization flag to the dm-snapshot table to explicitly requ=
est
> the COW initialization within the kernel?
>=20
> Another issue we are facing is to be able to know in advance what the min=
imum
> COW device size would be for a given update to be able to allocate the ri=
ght

This is hard to say, it depends on what the user is doing with the phone.=
=20
When dm-snapshot runs out of space, it invalidates the whole snapshot.=20
You'll have to monitor the snapshot space very carefully and take action=20
before it fills up.

I suggest - run main system on the origin target and attach a snapshot=20
that will be used for backup of the data overwritten in the origin. If the=
=20
updated system fails, merge the snapshot back into the origin; if the=20
update succeeds, drop the snapshot. If the user writes too much data to=20
the device, it would invalidate the only the snapshot (so he can't revert=
=20
anymore), but it would not invalidate the origin and the data would not be=
=20
lost.

> size for the COW device in advance.  To do so, we rely on the current COW
> structure that seems to have kept the same stable shape in the last decad=
e, and
> compute the total COW size by knowing the number of modified chunks. The
> formula would be something like that:
>=20
>   table_line_bytes      =3D 64 * 2 / 8;
>   exceptions_per_chunk  =3D chunk_size_bytes / table_line_bytes;
>   total_cow_size_chunks =3D 1 + 1 + modified_chunks
>                         + modified_chunks / exceptions_per_chunk;
>=20
> This formula seems to be valid for all the recent kernels we checked. Aga=
in,
> can we assume it to be valid for all the kernels for which
> SNAPSHOT_DISK_VERSION =3D=3D 1?

Yes, we don't plan to change it.

> -- Alignment
>=20
> Our approach follows the solution proposed by Mikulas [1].
> Being the block alignment of file extents automatically managed by the
> filesystem, using FIEMAP should have no alignment-related performance iss=
ue.
> But in our implementation we hit a misalignment [2] branch which leads to
> dmwarning messages [3, 4].
>=20
> I have a limited experience with the block layer and dm, so I'm still
> struggling in finding the root cause for this, either in user space or ke=
rnel
> space.

I don't know. What is the block size of the filesystem? Are all mappings=20
aligned to this block size?

> But our benchmarks seems to be good, so we were thinking as last option t=
o
> rate-limit or directly remove that warning from our kernels as a temporar=
y
> solution, but we prefer to avoid diverging from mainline. Rate-limiting i=
s a
> solution that would make sense also to be proposed in the list, but compl=
etely
> removing the warning doesn't seem the right thing to do. Maybe we are
> benchmarking something else? What do you think?
>=20
> Many thanks for taking the time to read this, feedbacks would be highly
> appreciated.
>=20
> Regards.
> Alessio
>=20
> [1] https://www.redhat.com/archives/dm-devel/2018-October/msg00363.html
> [2] https://elixir.bootlin.com/linux/v5.3/source/block/blk-settings.c#L54=
0
> [3] https://elixir.bootlin.com/linux/v5.3/source/drivers/md/dm-table.c#L4=
84
> [4] https://elixir.bootlin.com/linux/v5.3/source/drivers/md/dm-table.c#L1=
558

Mikulas

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

