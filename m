Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id BF74D21BCEA
	for <lists+dm-devel@lfdr.de>; Fri, 10 Jul 2020 20:27:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1594405625;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=EMbhxgWup/Hviij1CUpM3/gZ25zTWpk/esKrfGuLmjA=;
	b=erHi+OZhilZF4FrHb1q+GkcwQOy/JXZLMBJQov+vlp5Om556cUnVwg8WCe/azkXiQcGquU
	R1lEuKGjR8Bz0W/8NXCv8aM10E3nY9Np82548AOPj6t1YyHAyRehaa7fDatvJtDWCNEORt
	YV/wr6dxDMKIgiHuDRVucMsS1W8pXgE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-280-Jr0pif-oO9eGjDTmO4hPIw-1; Fri, 10 Jul 2020 14:27:01 -0400
X-MC-Unique: Jr0pif-oO9eGjDTmO4hPIw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9534DE91B;
	Fri, 10 Jul 2020 18:26:52 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 394125F7D8;
	Fri, 10 Jul 2020 18:26:45 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id E4FEC84352;
	Fri, 10 Jul 2020 18:26:29 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 06AIMFuk000752 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 10 Jul 2020 14:22:15 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id A49281A8EC; Fri, 10 Jul 2020 18:22:15 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from localhost (unknown [10.18.25.174])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C2ED919C66;
	Fri, 10 Jul 2020 18:22:12 +0000 (UTC)
Date: Fri, 10 Jul 2020 14:22:12 -0400
From: Mike Snitzer <snitzer@redhat.com>
To: Gabriel Krisman Bertazi <krisman@collabora.com>
Message-ID: <20200710182211.GA20272@redhat.com>
References: <alpine.LRH.2.02.2007081222500.4103@file01.intranet.prod.int.rdu2.redhat.com>
	<873661g8wq.fsf@collabora.com> <20200708173356.GA8116@redhat.com>
	<87v9ixer30.fsf@collabora.com>
MIME-Version: 1.0
In-Reply-To: <87v9ixer30.fsf@collabora.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com, Mikulas Patocka <mpatocka@redhat.com>,
	Khazhismel Kumykov <khazhy@google.com>
Subject: Re: [dm-devel] dm: use noio when sending kobject event
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
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Wed, Jul 08 2020 at  3:37pm -0400,
Gabriel Krisman Bertazi <krisman@collabora.com> wrote:

> Mike Snitzer <snitzer@redhat.com> writes:
> 
> > On Wed, Jul 08 2020 at  2:26pm -0400,
> > Gabriel Krisman Bertazi <krisman@collabora.com> wrote:
> >
> >> If I understand it correctly, considering the deadlock you shared, this
> >> doesn't solve the entire issue. For instance, kobject_uevent_env on the
> >> GFP_NOIO thread waits on uevent_sock_mutex, and another thread with
> >> GFP_IO holding the mutex might have triggered the shrinker from inside
> >> kobject_uevent_net_broadcast.  I believe 7e7cd796f277 ("scsi: iscsi: Fix
> >> deadlock on recovery path during GFP_IO reclaim") solved the one you
> >> shared and other similar cases for iSCSI in a different way.
> >
> > I staged a different fix, from Mikulas, for 5.9 that is meant to address
> > the original report, please see:
> > https://git.kernel.org/pub/scm/linux/kernel/git/device-mapper/linux-dm.git/commit/?h=dm-5.9&id=e5bfe9baf23dca211f4b794b651e871032c427ec
> >
> > I'd appreciate it if you could try this commit to se if it fixes the
> > original issue you reported.
> 
> I reverted 7e7cd796f277 and cherry-picked e5bfe9baf23dc on my tree.
> After a few iterations, I could see the conditions that formerly
> triggered the deadlock happening, but this patch successfully allowed
> the reclaim to succeed and the iscsi recovery thread to run.
> 
> My reproducer is a bit artificial, as I wrote it only from only the
> problem description provided by google.  They were hitting this in
> production and might have a better final word on the fix, though I know
> they don't have a simple way to reproduce it.

Nice job on getting together a reproducer that even begins to model
the issue google's production setup teased out.

Thanks for testing, I've added your Tested-by to the commit.

Mike

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

