Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 8919F143FDE
	for <lists+dm-devel@lfdr.de>; Tue, 21 Jan 2020 15:43:47 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1579617826;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=DUFVzszhQV/oHoWCt4I/vBEpJVKY4/DyGHjVwXk6pxM=;
	b=I7qooxTgpbAMxXaVRbKfz2DSsD+3GrInT1Ol4ZvpB4Lc1Hm0Go6A+VPsovsvZ03OHuJW6I
	jaTIV1/TTS3kC6DSvQuFiQ9+PPwQPah4vK4wwehUabVbrPGOmeiukCgHt6UtEGmKGdZfdq
	iyJuyrjUMPEg1z+O0aCK8ZWgdp8zt2A=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-215-JXEijxrGNH2hG_hhd1ToPA-1; Tue, 21 Jan 2020 09:43:42 -0500
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DE413DBA3;
	Tue, 21 Jan 2020 14:43:35 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 04C5C5DA87;
	Tue, 21 Jan 2020 14:43:30 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 419AE81988;
	Tue, 21 Jan 2020 14:43:25 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 00LEhGG3022305 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 21 Jan 2020 09:43:16 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id B7DBC86C54; Tue, 21 Jan 2020 14:43:16 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from localhost (unknown [10.18.25.174])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6A0EC8BE1B;
	Tue, 21 Jan 2020 14:43:11 +0000 (UTC)
Date: Tue, 21 Jan 2020 09:43:10 -0500
From: Mike Snitzer <snitzer@redhat.com>
To: Kirill Tkhai <ktkhai@virtuozzo.com>
Message-ID: <20200121144310.GA10055@redhat.com>
References: <157960325642.108120.13626623438131044304.stgit@localhost.localdomain>
	<157960337238.108120.18048939587162465175.stgit@localhost.localdomain>
	<20200121122458.GA9365@redhat.com>
	<f7e0fb38-a894-da33-c46b-e192ed907ee0@virtuozzo.com>
	<619a7a14-44e6-eca7-c1ea-3f04abeee53d@virtuozzo.com>
	<20200121134840.GA9944@redhat.com>
	<a19d5957-9aaa-b518-5855-e5fa2b5d3b22@virtuozzo.com>
MIME-Version: 1.0
In-Reply-To: <a19d5957-9aaa-b518-5855-e5fa2b5d3b22@virtuozzo.com>
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-MC-Unique: JXEijxrGNH2hG_hhd1ToPA-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Tue, Jan 21 2020 at  9:20am -0500,
Kirill Tkhai <ktkhai@virtuozzo.com> wrote:

> On 21.01.2020 16:48, Mike Snitzer wrote:
> > On Tue, Jan 21 2020 at  8:33am -0500,
> > Kirill Tkhai <ktkhai@virtuozzo.com> wrote:
> > 
> >> On 21.01.2020 15:36, Kirill Tkhai wrote:
> >>> On 21.01.2020 15:24, Mike Snitzer wrote:
> >>>> On Tue, Jan 21 2020 at  5:42am -0500,
> >>>> Kirill Tkhai <ktkhai@virtuozzo.com> wrote:
> >>>>
> >>>>> Since dm inherits limits from underlining block devices,
> >>>>> this patch directly disables max_allocate_sectors for dm
> >>>>> till full allocation support is implemented.
> >>>>>
> >>>>> This prevents high-level primitives (generic_make_request_checks(),
> >>>>> __blkdev_issue_write_zeroes(), ...) from sending REQ_ALLOCATE
> >>>>> requests.
> >>>>>
> >>>>> Signed-off-by: Kirill Tkhai <ktkhai@virtuozzo.com>
> >>>>> ---
> >>>>>  drivers/md/dm-table.c |    2 ++
> >>>>>  drivers/md/md.h       |    1 +
> >>>>>  2 files changed, 3 insertions(+)
> >>>>
> >>>> You're mixing DM and MD changes in the same patch.
> >>>>
> >>>> But I'm wondering if it might be best to set this default for stacking
> >>>> devices in blk_set_stacking_limits()?
> >>>>
> >>>> And then it is up to each stacking driver to override as needed.
> >>>
> >>> Hm. Sound like a good idea. This "lim->max_allocate_sectors = 0" in blk_set_stacking_limits()
> >>> should work for dm's dm_calculate_queue_limits(), since it calls blk_stack_limits(), which is:
> >>>
> >>> 	t->max_allocate_sectors = min(t->max_allocate_sectors,
> >>> 				      b->max_allocate_sectors);
> >>>
> >>> Could you please tell is this fix is also enough for md?
> >>
> >> It looks like it's enough since queue defaults are set in md_alloc()->blk_set_stacking_limits().
> >> In case of we set "max_allocate_sectors = 0", in further it can be changed only manually,
> >> but nobody does this.
> > 
> > Yes, it will work to disable this capability for MD and DM.
> > 
> > But if/when a stacked device _dooes_ want to support this then it'll be
> > awkward to override this stacking default to allow blk_stack_limits()
> > to properly stack up this limit.  blk_limits are extremely fiddley so
> > this isn't necessarily new.  But by explicitly defaulting to 0 and then
> > having blk_stack_limits use min() for this limit: it results in stacking
> > drivers needing to clumsily unwind the default.  E.g. DM will need to
> > tweak its blk_stack_limits() related code to allow override that
> > actually _does_  stack up the underlying devices' capability (and not
> > just impose its own limit that ignores the underlying devices).
> > 
> > So I'm not convinced this is the right way to go (be it the v4 approach
> > you took or the cleaner use of blk_set_stacking_limits I suggested).
> 
> Is there a strong vision about the way we should go? Or you leave this choose
> up to me?

I don't have time to work through it at the moment (e.g. implementing
dm-thinp support to know what the block core code should be) so I'll
just defer to you on a disabling it for now.

> > And to be clear, I'm interested in having DM thinp support this
> > capability to preallocate blocks.
> 
> My opinion is it would be better to not mix several subsystem related
> support in a single patch set. Both of the approaches (v4 or that you
> suggested) do not prevents us to implement allocation support in next
> patch series. After we have the base functionality enabled, we may add
> support in other subsystems and drivers one by one with more focus
> on the subsystem specificities and with the best possible attention.

Yeah, I'm aware nothing is ever set in stone.

Setting to 0 in blk_set_stacking_limits() is OK for now.

Thanks,
Mike

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

