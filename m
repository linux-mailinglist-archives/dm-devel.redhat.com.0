Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id 3C2DFE4865
	for <lists+dm-devel@lfdr.de>; Fri, 25 Oct 2019 12:17:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1571998624;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=OiVjuJzv8AQ7wUnEQCkCm0vIAfkGtrzZ4BSPjSDZ6A0=;
	b=CiOpSaQJdFktpY11CfTX0UYhTjgQjPn0mq+yklYWLh6TZ1UHQj6oL5/lICP7SCABTJEpIZ
	AhzYjwdWZAM8FpAg4xKwQb838d+0z8xV9y09AgGPD2e+ejMWThwS6VxD9Ww5ENvdIj4d0G
	UjIKzUBG6IBZy9URTZZ9w1vAp4K2gq8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-16-x1HIf7v_NRW9Nl-yMaVmgA-1; Fri, 25 Oct 2019 06:17:01 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A81151800E00;
	Fri, 25 Oct 2019 10:16:54 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id CCA665DD64;
	Fri, 25 Oct 2019 10:16:51 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 1D3D64E58A;
	Fri, 25 Oct 2019 10:16:44 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x9PAGVWX022872 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 25 Oct 2019 06:16:31 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id C254D608C1; Fri, 25 Oct 2019 10:16:31 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx04.extmail.prod.ext.phx2.redhat.com
	[10.5.110.28])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id BDA8A60852
	for <dm-devel@redhat.com>; Fri, 25 Oct 2019 10:16:29 +0000 (UTC)
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com
	[209.85.221.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 49B7785540
	for <dm-devel@redhat.com>; Fri, 25 Oct 2019 10:16:28 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id w18so1674102wrt.3
	for <dm-devel@redhat.com>; Fri, 25 Oct 2019 03:16:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
	:content-disposition:user-agent;
	bh=NP2Oouc7q1f33SRB3lHPUh+PTnPTT6dHPVBMKG6sPiU=;
	b=gKVLDofActmiXehXTVQqpjkbIhAJVGIJD6TbFEywYjiJQ6+xOmKdSCMrf7FH+umYXe
	bWWdtfVcNm1fD1VycZ+fT+aI5KGz6Bx0KHHTEKm+i+ly7Rc8diXZbNYNDpJydaCQX9iq
	suj+F30b7wiH+UXkAwFTW4Jqe0W/ICIbeERWkpH7l1xuUAiKVtLekyPwK0dkPaQNKq/7
	2txiZpnASnHOB2C1GzsDrHiXv+wHqGh06S7yIL5RWDIVgdWOuc3BMZSfo5aE9BjM08RJ
	X3ZClIgukIi4mi7hzZrb1gEFN5M/FGawhhy3qM8XkXa/AMQs8gw+qK7OJYNydqkDhnGf
	N0Pg==
X-Gm-Message-State: APjAAAWJFirKxoukLWIodRzQdAOsnYzjUvURAnAxQocnXqAxftBiqTRh
	B3rLYJEYkEApIvRnOZ2woQdi7A==
X-Google-Smtp-Source: APXvYqyQmDbEw04RVn2bj6bG5HpjBc5PMzPUHuWj3daUsWSfNOQ0apCRK9QUZmbPG1dd/cOcivlT2g==
X-Received: by 2002:a5d:5388:: with SMTP id d8mr2281953wrv.92.1571998586903;
	Fri, 25 Oct 2019 03:16:26 -0700 (PDT)
Received: from google.com ([2a00:79e0:d:210:e751:37a0:1e95:e65d])
	by smtp.gmail.com with ESMTPSA id
	r19sm1732999wrr.47.2019.10.25.03.16.26
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 25 Oct 2019 03:16:26 -0700 (PDT)
Date: Fri, 25 Oct 2019 11:16:24 +0100
From: Alessio Balsini <balsini@android.com>
To: Jens Axboe <axboe@kernel.dk>, Alasdair G Kergon <agk@redhat.com>,
	Mikulas Patocka <mpatocka@redhat.com>
Message-ID: <20191025101624.GA61225@google.com>
MIME-Version: 1.0
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.28]);
	Fri, 25 Oct 2019 10:16:28 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.28]);
	Fri, 25 Oct 2019 10:16:28 +0000 (UTC) for IP:'209.85.221.68'
	DOMAIN:'mail-wr1-f68.google.com' HELO:'mail-wr1-f68.google.com'
	FROM:'balsini@android.com' RCPT:''
X-RedHat-Spam-Score: 1.695 * (DKIMWL_WL_HIGH, DKIM_SIGNED, DKIM_VALID,
	DKIM_VALID_AU, FSL_HELO_FAKE, RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H2, SPF_HELO_NONE,
	SPF_PASS) 209.85.221.68 mail-wr1-f68.google.com 209.85.221.68
	mail-wr1-f68.google.com <balsini@android.com>
X-Scanned-By: MIMEDefang 2.78 on 10.5.110.28
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-loop: dm-devel@redhat.com
Cc: linux-block@vger.kernel.org, linux-kernel@vger.kernel.org, elsk@google.com,
	dm-devel@redhat.com, dvander@google.com, kernel-team@android.com
Subject: [dm-devel] dm-snapshot for system updates in Android
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
X-MC-Unique: x1HIf7v_NRW9Nl-yMaVmgA-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

Hello everyone!

I hope you will appreciate knowing that we are currently evaluating the use=
 of
dm-snapshot to implement a mechanism to obtain revertible, space-efficient
system upgrades in Android.  More specifically, we are using
dm-snapshot-persistent to test the updated device after reboot, then issue =
a
merge in case of success, otherwise, destroy the snapshot.
This new update mechanism is still under evaluation, but its development is
openly done in AOSP.

At the current stage, we have a prototype we are happy with, both in terms =
of
space consumption overhead (for the COW device) and benchmarking results fo=
r
read-write and merge operations.

I would be glad if you could provide some feedback on a few points that I d=
on't
have completely clear.


-- Interface stability

To obtain an initial, empty COW device as quick as possible, we force to 0 =
only
its first 32 bit (magic field). This solution looks clear from the kernel c=
ode,
but can we rely on that for all the kernels with SNAPSHOT_DISK_VERSION =3D=
=3D 1?
Would you appreciate it if a similar statement is added as part of
/Documentation, making this solution more stable? Or maybe I can think of
adding an initialization flag to the dm-snapshot table to explicitly reques=
t
the COW initialization within the kernel?

Another issue we are facing is to be able to know in advance what the minim=
um
COW device size would be for a given update to be able to allocate the righ=
t
size for the COW device in advance.  To do so, we rely on the current COW
structure that seems to have kept the same stable shape in the last decade,=
 and
compute the total COW size by knowing the number of modified chunks. The
formula would be something like that:

  table_line_bytes      =3D 64 * 2 / 8;
  exceptions_per_chunk  =3D chunk_size_bytes / table_line_bytes;
  total_cow_size_chunks =3D 1 + 1 + modified_chunks
                        + modified_chunks / exceptions_per_chunk;

This formula seems to be valid for all the recent kernels we checked. Again=
,
can we assume it to be valid for all the kernels for which
SNAPSHOT_DISK_VERSION =3D=3D 1?


-- Alignment

Our approach follows the solution proposed by Mikulas [1].
Being the block alignment of file extents automatically managed by the
filesystem, using FIEMAP should have no alignment-related performance issue=
.
But in our implementation we hit a misalignment [2] branch which leads to
dmwarning messages [3, 4].

I have a limited experience with the block layer and dm, so I'm still
struggling in finding the root cause for this, either in user space or kern=
el
space.
But our benchmarks seems to be good, so we were thinking as last option to
rate-limit or directly remove that warning from our kernels as a temporary
solution, but we prefer to avoid diverging from mainline. Rate-limiting is =
a
solution that would make sense also to be proposed in the list, but complet=
ely
removing the warning doesn't seem the right thing to do. Maybe we are
benchmarking something else? What do you think?

Many thanks for taking the time to read this, feedbacks would be highly
appreciated.

Regards.
Alessio

[1] https://www.redhat.com/archives/dm-devel/2018-October/msg00363.html
[2] https://elixir.bootlin.com/linux/v5.3/source/block/blk-settings.c#L540
[3] https://elixir.bootlin.com/linux/v5.3/source/drivers/md/dm-table.c#L484
[4] https://elixir.bootlin.com/linux/v5.3/source/drivers/md/dm-table.c#L155=
8

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

