Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id A432924B103
	for <lists+dm-devel@lfdr.de>; Thu, 20 Aug 2020 10:26:55 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-403-MsgZ8H8HMc2LahMD2KXa4g-1; Thu, 20 Aug 2020 04:26:52 -0400
X-MC-Unique: MsgZ8H8HMc2LahMD2KXa4g-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C88558030AA;
	Thu, 20 Aug 2020 08:26:45 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2EA0A7A424;
	Thu, 20 Aug 2020 08:26:41 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 10B821826D2B;
	Thu, 20 Aug 2020 08:26:34 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 07K8PXgV026871 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 20 Aug 2020 04:25:33 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 22F8FEE388; Thu, 20 Aug 2020 08:25:33 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1F0F4EAFB9
	for <dm-devel@redhat.com>; Thu, 20 Aug 2020 08:25:30 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 531EF101AA41
	for <dm-devel@redhat.com>; Thu, 20 Aug 2020 08:25:30 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99]) (Using TLS)
	by relay.mimecast.com with ESMTP id us-mta-413-Nly7vJtoPuC_IBlAfIas4g-1;
	Thu, 20 Aug 2020 04:25:28 -0400
X-MC-Unique: Nly7vJtoPuC_IBlAfIas4g-1
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl
	[83.86.89.107])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 78703207DE;
	Thu, 20 Aug 2020 08:17:40 +0000 (UTC)
Date: Thu, 20 Aug 2020 10:18:01 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Mike Snitzer <snitzer@redhat.com>
Message-ID: <20200820081801.GH4049659@kroah.com>
References: <8CFF8DA9-C105-461C-8F5A-DA2BF448A135@oracle.com>
	<20200804124735.GA219143@kroah.com>
	<20200804182037.GA15453@redhat.com>
	<20200805143242.GC2154236@kroah.com>
	<20200805193409.GA21824@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20200805193409.GA21824@redhat.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false;
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-loop: dm-devel@redhat.com
Cc: John Donnelly <john.p.donnelly@oracle.com>, dm-devel@redhat.com,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	stable@vger.kernel.org
Subject: Re: [dm-devel] fixing 4.14-stable's broken DM cache writethrough
 support [was: Re: [(resend) PATCH v3: {linux-4.14.y} ] dm cache: submit
 writethrough writes in parallel to origin and cache]
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
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0.002
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Wed, Aug 05, 2020 at 03:34:09PM -0400, Mike Snitzer wrote:
> On Wed, Aug 05 2020 at 10:32am -0400,
> Greg KH <gregkh@linuxfoundation.org> wrote:
> 
> > On Tue, Aug 04, 2020 at 02:20:38PM -0400, Mike Snitzer wrote:
> > > On Tue, Aug 04 2020 at  8:47am -0400,
> > > Greg KH <gregkh@linuxfoundation.org> wrote:
> > > 
> > > > On Tue, Aug 04, 2020 at 07:33:05AM -0500, John Donnelly wrote:
> > > > > From: Mike Snitzer <snitzer@redhat.com>
> > > > > 
> > > > > Discontinue issuing writethrough write IO in series to the origin and
> > > > > then cache.
> > > > > 
> > > > > Use bio_clone_fast() to create a new origin clone bio that will be
> > > > > mapped to the origin device and then bio_chain() it to the bio that gets
> > > > > remapped to the cache device.  The origin clone bio does _not_ have a
> > > > > copy of the per_bio_data -- as such check_if_tick_bio_needed() will not
> > > > > be called.
> > > > > 
> > > > > The cache bio (parent bio) will not complete until the origin bio has
> > > > > completed -- this fulfills bio_clone_fast()'s requirements as well as
> > > > > the requirement to not complete the original IO until the write IO has
> > > > > completed to both the origin and cache device.
> > > > > 
> > > > > Signed-off-by: Mike Snitzer <snitzer@redhat.com>
> > > > > 
> > > > > (cherry picked from commit 2df3bae9a6543e90042291707b8db0cbfbae9ee9)
> > > > > 
> > > > > Fixes: 4ec34f2196d125ff781170ddc6c3058c08ec5e73 (dm bio record:
> > > > > save/restore bi_end_io and bi_integrity )
> > > > > 
> > > > > 4ec34f21 introduced a mkfs.ext4 hang on a LVM device that has been
> > > > > modified with lvconvert --cachemode=writethrough.
> > > > > 
> > > > > CC:stable@vger.kernel.org for 4.14.y
> > > > > 
> > > > > Signed-off-by: John Donnelly <john.p.donnelly@oracle.com>
> > > > > Reviewed-by: Somasundaram Krishnasamy <somasundaram.krishnasamy@oracle.com>
> > > > > 
> > > > > conflicts:
> > > > > 	drivers/md/dm-cache-target.c. -  Corrected usage of
> > > > > 	writethrough_mode(&cache->feature) that was caught by
> > > > > 	compiler, and removed unused static functions : writethrough_endio(),
> > > > > 	defer_writethrough_bio(), wake_deferred_writethrough_worker()
> > > > > 	that generated warnings.
> > > > 
> > > > What is this "conflicts nonsense"?  You don't see that in any other
> > > > kernel patch changelog, do you?
> > > > 
> > > > > ---
> > > > > drivers/md/dm-cache-target.c | 92 ++++++++++++++++++--------------------------
> > > > > 1 file changed, 37 insertions(+), 55 deletions(-)
> > > > 
> > > > Please fix your email client up, it's totally broken and this does not
> > > > work at all and is getting frustrating from my side here.
> > > > 
> > > > Try sending emails to yourself and see if you can apply the patches, as
> > > > the one you sent here does not work, again:
> > > 
> > > John's inability to submit a patch that can apply aside: I do not like
> > > how this patch header is constructed (yet attributed "From" me).  It is
> > > devoid of detail as it relates to stable@.
> > > 
> > > Greg, please don't apply the v4 of this patch either.  I'll craft a
> > > proper stable@ patch that explains the reason for change and why we're
> > > left having to resolve conflicts in stable@.
> > > 
> > > But first I need to focus on sending DM changes to Linus for v5.9 merge.
> > 
> > Ok, no worries, I'll drop all of these from my review queue and wait for
> > something from you sometime in the future.
> 
> Hey Greg,
> 
> SO I've looked this required 4.14 stable@ backport over. Because 4.14
> already has these commits (to fix a dm integrity issue):
> 1b17159e52b dm bio record: save/restore bi_end_io and bi_integrity
> 248aa2645aa dm integrity: use dm_bio_record and dm_bio_restore
> 
> DM-cache's 4.14 writethrough mode got broken because its implementation
> (ab)used dm_hook_bio+dm_bio_record and predates 4.15's switch to using
> bio_chain() via commit 2df3bae9a654.  Without commit 2df3bae9a654 the
> dm_hook_bio+dm_bio_record changes from commit 1b17159e52b break
> dm-cache's writethrough support.
> 
> So 4.14-stable now needs these 3 upstream 4.15 commits:
> 8e3c3827776f dm cache: pass cache structure to mode functions
> 2df3bae9a654 dm cache: submit writethrough writes in parallel to origin and cache
> 9958f1d9a04e dm cache: remove all obsolete writethrough-specific code
> 
> Applying those commits to v4.14.190 with:
> git cherry-pick -x 8e3c3827776f^..9958f1d9a04e
> 
> results in a kernel that successfully builds and should fix
> 4.14-stable's broken dm-cache writethrough support.
> 
> Are you ok with queueing up applying these 3 upstream commits to
> 4.14-stable or do you need me to send a patchset?

This is good enough, now all queued up, thanks!

greg k-h

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

