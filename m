Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id 759351007F0
	for <lists+dm-devel@lfdr.de>; Mon, 18 Nov 2019 16:14:24 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1574090063;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=3CE8UvuuZa4zn0P4dvtZDLOqRqAiBYpamZfFRv1R0Ts=;
	b=JaT4I95MObb9XsAkrkFccugx+BvjeIRVZ37VA+KrdAdgbVOpqr6+3kqsdqX2qCCDmvyvjL
	nCRG58p9V5QsxlZ+Fi1b3HnE5Ye73p2oWZzPxMkj/LUDMgGaT0k9dFGpHL6PL0Cs1XZ3DI
	pqaI8aZFMAOBNE2p/1dJHjK4mjuMYww=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-185-Rme67OPoOtyff1ZuBkMxxw-1; Mon, 18 Nov 2019 10:14:21 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0442D10D2F42;
	Mon, 18 Nov 2019 15:14:13 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9228860856;
	Mon, 18 Nov 2019 15:14:08 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id CE2E71803C37;
	Mon, 18 Nov 2019 15:13:52 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id xAIFDb6Z022149 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 18 Nov 2019 10:13:37 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id EA4A960BE1; Mon, 18 Nov 2019 15:13:37 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from localhost (unknown [10.18.25.174])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B341561071;
	Mon, 18 Nov 2019 15:13:31 +0000 (UTC)
Date: Mon, 18 Nov 2019 10:13:30 -0500
From: Mike Snitzer <snitzer@redhat.com>
To: Jeffle Xu <jefflexu@linux.alibaba.com>
Message-ID: <20191118151330.GA9830@redhat.com>
References: <1574041838-92149-1-git-send-email-jefflexu@linux.alibaba.com>
MIME-Version: 1.0
In-Reply-To: <1574041838-92149-1-git-send-email-jefflexu@linux.alibaba.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-loop: dm-devel@redhat.com
Cc: joseph.qi@linux.alibaba.com, ejt@redhat.com, dm-devel@redhat.com,
	agk@redhat.com
Subject: Re: [dm-devel] [PATCH v2] dm-thin: wakeup worker only when deferred
	bios exist
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-MC-Unique: Rme67OPoOtyff1ZuBkMxxw-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

On Sun, Nov 17 2019 at  8:50pm -0500,
Jeffle Xu <jefflexu@linux.alibaba.com> wrote:

> Single thread fio test (read, bs=3D4k, ioengine=3Dlibaio, iodepth=3D128,
> numjobs=3D1) over dm-thin device has poor performance versus bare nvme
> disk.
>=20
> Further investigation with perf indicates that queue_work_on() consumes
> over 20% CPU time when doing IO over dm-thin device. The call stack is
> as follows.
>=20
> - 40.57% thin_map
>     + 22.07% queue_work_on
>     + 9.95% dm_thin_find_block
>     + 2.80% cell_defer_no_holder
>       1.91% inc_all_io_entry.isra.33.part.34
>     + 1.78% bio_detain.isra.35
>=20
> In cell_defer_no_holder(), wakeup_worker() is always called, no matter
> whether the tc->deferred_bio_list list is empty or not. In single thread
> IO model, this list is most likely empty. So skip waking up worker thread
> if tc->deferred_bio_list list is empty.
>=20
> A significant IO performance of single thread can be seen with this patch=
.
> The original IO performance is 448 MiB/s with the fio test previously
> described, while it is 646 MiB/s after applying the patch, which is a
> 44% performance improvement.
>=20
> Signed-off-by: Jeffle Xu <jefflexu@linux.alibaba.com>
> ---
> Changes since V1:
> 1. Check whether tc->deferred_bio_list list is empty or not, rather than
> cell->bios as before.
> 2. Retest the performance with the new version of this patch, and update
> the statistics in the commit message.

I've staged this with slight revisions to the header and renamed the
empty variable to has_work, please see:
https://git.kernel.org/pub/scm/linux/kernel/git/device-mapper/linux-dm.git/=
commit/?h=3Ddm-5.5&id=3Dd256d796279de0bdc227ff4daef565aa7e80c898

Thanks.

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

