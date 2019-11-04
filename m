Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 39464EE518
	for <lists+dm-devel@lfdr.de>; Mon,  4 Nov 2019 17:49:44 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1572886183;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=VC5MDJcVnma32Y4SAcpm6q/gXl4bJw4sThvweP7cf4c=;
	b=Mxz9p/V5WeqpWkVRF+Be8czdvA6ctNzqiqG5AnSaDdcNOvUmF3Z/+hAviJCDDuP+drO4E8
	I0anxKSFDMVnHpIr8AnNXFhqQ4u7nRB0/Ojyhtsnp7ZiJ0Qb0GLsugEEKRZRb27vq8LO4O
	cS2rW4xPaaYOJuuFipRAtb4zbMlte2w=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-97-NicBOgTjMKOHhsfX_JcwNg-1; Mon, 04 Nov 2019 11:49:40 -0500
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id F0F97800054;
	Mon,  4 Nov 2019 16:49:33 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 95BFD5D9CD;
	Mon,  4 Nov 2019 16:49:30 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 88A634BB65;
	Mon,  4 Nov 2019 16:49:20 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id xA4Gn9I5026954 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 4 Nov 2019 11:49:09 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 2D79B50; Mon,  4 Nov 2019 16:49:09 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx02.extmail.prod.ext.phx2.redhat.com
	[10.5.110.26])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 274F319C68
	for <dm-devel@redhat.com>; Mon,  4 Nov 2019 16:49:06 +0000 (UTC)
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com
	[209.85.128.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id C08E5806CD
	for <dm-devel@redhat.com>; Mon,  4 Nov 2019 16:49:04 +0000 (UTC)
Received: by mail-wm1-f66.google.com with SMTP id c22so16817641wmd.1
	for <dm-devel@redhat.com>; Mon, 04 Nov 2019 08:49:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=2GCXse3i8dZWY3iqcdbG+HD0y8Pc0P0D/i6paZcwU8A=;
	b=RRe8TYglnXIpGSBdnXY5AsN8eyY5PfuoEnlinrNg6IM+QRoDiuBxhaDweSSCzY+4GN
	O/cY2FyLlcLAg+lyKQeXC/mzEQEcpb6eS5U4OwFQW8m+omrM+iNMf4yI9pW4T5Kl+w1p
	kHkyB8s/XqfCTnNuBV4GESnybU2k3+ElDVrOsMj0qFymBHL/H3eO6m9gD3z4dnskBo8A
	9Puk5wfUX9Q/8z6JHXWCy3Uy72h+D8+BSlW8k+rpw1iQ5ZWwo1MtHaoDg62WvPVK2OAe
	VOg4NsYbcmf651wNK62gtcQtclIfrjQz7mgoUtTIZRWzA8ODoPHgI/SFlPelQMYM+DXo
	cUjA==
X-Gm-Message-State: APjAAAVg8MCREAo3l1e9td1dBf74nnZBgw5vnb9eN+P23mtoZWytsWYp
	aEOmla0d8RmUZRmPtd2wWFVLug==
X-Google-Smtp-Source: APXvYqzS3PC9EJyw/esjee1y5JXKX5z6exdfXWx7Y3WpW46Yp/B/ETCxm60YFm9UwlSt0+elBZDFaA==
X-Received: by 2002:a1c:60d7:: with SMTP id u206mr15589wmb.101.1572886143360; 
	Mon, 04 Nov 2019 08:49:03 -0800 (PST)
Received: from google.com ([2a00:79e0:d:210:e751:37a0:1e95:e65d])
	by smtp.gmail.com with ESMTPSA id
	x205sm23003638wmb.5.2019.11.04.08.49.02
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 04 Nov 2019 08:49:02 -0800 (PST)
Date: Mon, 4 Nov 2019 16:49:00 +0000
From: Alessio Balsini <balsini@android.com>
To: Mikulas Patocka <mpatocka@redhat.com>
Message-ID: <20191104164900.GA10934@google.com>
References: <20191025101624.GA61225@google.com>
	<alpine.LRH.2.02.1910290957220.25731@file01.intranet.prod.int.rdu2.redhat.com>
MIME-Version: 1.0
In-Reply-To: <alpine.LRH.2.02.1910290957220.25731@file01.intranet.prod.int.rdu2.redhat.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.26]);
	Mon, 04 Nov 2019 16:49:05 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.26]);
	Mon, 04 Nov 2019 16:49:05 +0000 (UTC) for IP:'209.85.128.66'
	DOMAIN:'mail-wm1-f66.google.com' HELO:'mail-wm1-f66.google.com'
	FROM:'balsini@android.com' RCPT:''
X-RedHat-Spam-Score: 4.344 **** (DKIMWL_WL_HIGH, DKIM_SIGNED, DKIM_VALID,
	DKIM_VALID_AU, FSL_HELO_FAKE, RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H2, SPF_HELO_NONE,
	SPF_PASS) 209.85.128.66 mail-wm1-f66.google.com 209.85.128.66
	mail-wm1-f66.google.com <balsini@android.com>
X-Scanned-By: MIMEDefang 2.78 on 10.5.110.26
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-MC-Unique: NicBOgTjMKOHhsfX_JcwNg-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

Hi Mikulas,

Thank you for your answer and suggestions.

On Tue, Oct 29, 2019 at 10:21:14AM -0400, Mikulas Patocka wrote:
> Hi
>=20
> On Fri, 25 Oct 2019, Alessio Balsini wrote:
>=20
> > Hello everyone!
> >=20
> > I hope you will appreciate knowing that we are currently evaluating the=
 use of
> > dm-snapshot to implement a mechanism to obtain revertible, space-effici=
ent
> > system upgrades in Android.  More specifically, we are using
> > dm-snapshot-persistent to test the updated device after reboot, then is=
sue a
> > merge in case of success, otherwise, destroy the snapshot.
> > This new update mechanism is still under evaluation, but its developmen=
t is
> > openly done in AOSP.
> >=20
> > At the current stage, we have a prototype we are happy with, both in te=
rms of
> > space consumption overhead (for the COW device) and benchmarking result=
s for
> > read-write and merge operations.
> >=20
> > I would be glad if you could provide some feedback on a few points that=
 I don't
> > have completely clear.
> >=20
> >=20
> > -- Interface stability
> >=20
> > To obtain an initial, empty COW device as quick as possible, we force t=
o 0 only
> > its first 32 bit (magic field). This solution looks clear from the kern=
el code,
> > but can we rely on that for all the kernels with SNAPSHOT_DISK_VERSION =
=3D=3D 1?
>=20
> It will work, but, to be consistent with lvm, I suggest to overwrite the=
=20
> first 4k with zeroes.
>=20
> > Would you appreciate it if a similar statement is added as part of
> > /Documentation, making this solution more stable? Or maybe I can think =
of
> > adding an initialization flag to the dm-snapshot table to explicitly re=
quest
> > the COW initialization within the kernel?
> >=20
> > Another issue we are facing is to be able to know in advance what the m=
inimum
> > COW device size would be for a given update to be able to allocate the =
right
>=20
> This is hard to say, it depends on what the user is doing with the phone.=
=20
> When dm-snapshot runs out of space, it invalidates the whole snapshot.=20
> You'll have to monitor the snapshot space very carefully and take action=
=20
> before it fills up.

I forgot to mention that all the partitions we are updating are
read-only, and can only be modified by snapshot-merge. This allows us to
establish a direct relation between the required COW device size and the
operations performed by the update (i.e. the number of chunks that are
going to be modified).

>=20
> I suggest - run main system on the origin target and attach a snapshot=20
> that will be used for backup of the data overwritten in the origin. If th=
e=20
> updated system fails, merge the snapshot back into the origin; if the=20
> update succeeds, drop the snapshot. If the user writes too much data to=
=20
> the device, it would invalidate the only the snapshot (so he can't revert=
=20
> anymore), but it would not invalidate the origin and the data would not b=
e=20
> lost.

This is an approach we evaluated, but the main reason why we decided for
the solution of updating the snapshot and then merging it to the base
device is that we want to be sure that the update was successful before
permanently change to the base device. For example, if for some reason
the update is interrupted, it would be more difficult to roll-back or
restore the update. Additionally, if the update wants to resize the
partitions, this operation could not be done until reboot.

>=20
> > size for the COW device in advance.  To do so, we rely on the current C=
OW
> > structure that seems to have kept the same stable shape in the last dec=
ade, and
> > compute the total COW size by knowing the number of modified chunks. Th=
e
> > formula would be something like that:
> >=20
> >   table_line_bytes      =3D 64 * 2 / 8;
> >   exceptions_per_chunk  =3D chunk_size_bytes / table_line_bytes;
> >   total_cow_size_chunks =3D 1 + 1 + modified_chunks
> >                         + modified_chunks / exceptions_per_chunk;
> >=20
> > This formula seems to be valid for all the recent kernels we checked. A=
gain,
> > can we assume it to be valid for all the kernels for which
> > SNAPSHOT_DISK_VERSION =3D=3D 1?
>=20
> Yes, we don't plan to change it.
>=20
> > -- Alignment
> >=20
> > Our approach follows the solution proposed by Mikulas [1].
> > Being the block alignment of file extents automatically managed by the
> > filesystem, using FIEMAP should have no alignment-related performance i=
ssue.
> > But in our implementation we hit a misalignment [2] branch which leads =
to
> > dmwarning messages [3, 4].
> >=20
> > I have a limited experience with the block layer and dm, so I'm still
> > struggling in finding the root cause for this, either in user space or =
kernel
> > space.
>=20
> I don't know. What is the block size of the filesystem? Are all mappings=
=20
> aligned to this block size?

Here follows a just generated warning coming from a Pixel 4 kernel (4.14):

[ 3093.443808] device-mapper: table: 253:16: adding target device dm-15
caused an alignment inconsistency: physical_block_size=3D4096,
logical_block_size=3D4096, alignment_offset=3D61440, start=3D0

Does this contain all the info you asked for?

I started investigating this issue, but since we didn't notice any
performance degradation, I prioritized other things. I'll be hopefully
able to get back to this warning in the next months.
Please let me know if I can help you with that or if you need additional
information.

>=20
> > But our benchmarks seems to be good, so we were thinking as last option=
 to
> > rate-limit or directly remove that warning from our kernels as a tempor=
ary
> > solution, but we prefer to avoid diverging from mainline. Rate-limiting=
 is a
> > solution that would make sense also to be proposed in the list, but com=
pletely
> > removing the warning doesn't seem the right thing to do. Maybe we are
> > benchmarking something else? What do you think?
> >=20
> > Many thanks for taking the time to read this, feedbacks would be highly
> > appreciated.
> >=20
> > Regards.
> > Alessio
> >=20
> > [1] https://www.redhat.com/archives/dm-devel/2018-October/msg00363.html
> > [2] https://elixir.bootlin.com/linux/v5.3/source/block/blk-settings.c#L=
540
> > [3] https://elixir.bootlin.com/linux/v5.3/source/drivers/md/dm-table.c#=
L484
> > [4] https://elixir.bootlin.com/linux/v5.3/source/drivers/md/dm-table.c#=
L1558
>=20
> Mikulas
>=20

Thanks again,
Alessio

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

