Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id EDD04143CBC
	for <lists+dm-devel@lfdr.de>; Tue, 21 Jan 2020 13:25:36 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1579609535;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=XRY4epKahjHDQB8S1fp8+D5GR5zzAJcYcc6udKPRINo=;
	b=cqVGGr7MifX8xy1RPt2RzGuWfeXHBHlhuuwZx1rxomQkbfva4JjiKGEerU51f9tM6SpueT
	jjK6N2Hqs1qFk5iZlsY4M8deZioFAUl0M0Y8Dj+PxyjzHdtF2eW4jce8o6lNMvuGcjvtWQ
	jBVdEtxjqxIXaZ1LOcsWirhVehnXSMs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-388-mR6cF2BgOx-V_y-WhEZAGQ-1; Tue, 21 Jan 2020 07:25:33 -0500
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 26B1A107ACC7;
	Tue, 21 Jan 2020 12:25:26 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9A02D10027A9;
	Tue, 21 Jan 2020 12:25:23 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 2396F81975;
	Tue, 21 Jan 2020 12:25:17 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 00LCP5V9011886 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 21 Jan 2020 07:25:05 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id DF12C8BE2D; Tue, 21 Jan 2020 12:25:05 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from localhost (unknown [10.18.25.174])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B78508BE17;
	Tue, 21 Jan 2020 12:24:59 +0000 (UTC)
Date: Tue, 21 Jan 2020 07:24:59 -0500
From: Mike Snitzer <snitzer@redhat.com>
To: Kirill Tkhai <ktkhai@virtuozzo.com>
Message-ID: <20200121122458.GA9365@redhat.com>
References: <157960325642.108120.13626623438131044304.stgit@localhost.localdomain>
	<157960337238.108120.18048939587162465175.stgit@localhost.localdomain>
MIME-Version: 1.0
In-Reply-To: <157960337238.108120.18048939587162465175.stgit@localhost.localdomain>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-loop: dm-devel@redhat.com
Cc: andrea.parri@amarulasolutions.com, dhowells@redhat.com, song@kernel.org,
	dm-devel@redhat.com, adilger.kernel@dilger.ca, osandov@fb.com,
	agk@redhat.com, hare@suse.com, sagi@grimberg.me,
	darrick.wong@oracle.com, bob.liu@oracle.com,
	minwoo.im.dev@gmail.com, jthumshirn@suse.de, ajay.joshi@wdc.com,
	Chaitanya.Kulkarni@wdc.com, ming.lei@redhat.com,
	linux-block@vger.kernel.org, dsterba@suse.com,
	bvanassche@acm.org, axboe@kernel.dk, damien.lemoal@wdc.com,
	tytso@mit.edu, martin.petersen@oracle.com,
	linux-kernel@vger.kernel.org, tj@kernel.org, asml.silence@gmail.com
Subject: Re: [dm-devel] [PATCH v4 6/7] dm: Directly disable
	max_allocate_sectors for now
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-MC-Unique: mR6cF2BgOx-V_y-WhEZAGQ-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Tue, Jan 21 2020 at  5:42am -0500,
Kirill Tkhai <ktkhai@virtuozzo.com> wrote:

> Since dm inherits limits from underlining block devices,
> this patch directly disables max_allocate_sectors for dm
> till full allocation support is implemented.
> 
> This prevents high-level primitives (generic_make_request_checks(),
> __blkdev_issue_write_zeroes(), ...) from sending REQ_ALLOCATE
> requests.
> 
> Signed-off-by: Kirill Tkhai <ktkhai@virtuozzo.com>
> ---
>  drivers/md/dm-table.c |    2 ++
>  drivers/md/md.h       |    1 +
>  2 files changed, 3 insertions(+)

You're mixing DM and MD changes in the same patch.

But I'm wondering if it might be best to set this default for stacking
devices in blk_set_stacking_limits()?

And then it is up to each stacking driver to override as needed.

Mike

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

