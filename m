Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id 017BB218FC1
	for <lists+dm-devel@lfdr.de>; Wed,  8 Jul 2020 20:35:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1594233335;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=FI8xbWWAhO48PkIquS+nmbMkMnCTI7AnnbvK/ZW43iY=;
	b=PorqV0UHUlStmLs+erwuTZc9EHEJo3QO93SjHdfg5IupTq3T5UQIwVoXE16kE4mVnkfSU0
	J/fzHGU9fy/PTgvSSpN4AZigV26n+aP9UX+JBztnjRwGCDpTcAndGTB1i14mbYXOMcxDBh
	J6T8m9kUXRIjeLQxfHZOrZaOgQLlHqU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-58-owQ5j6frMN2GfwGvyT-3_A-1; Wed, 08 Jul 2020 14:35:31 -0400
X-MC-Unique: owQ5j6frMN2GfwGvyT-3_A-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6078019057D5;
	Wed,  8 Jul 2020 18:35:25 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 06958724B3;
	Wed,  8 Jul 2020 18:35:25 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id CACE572F7F;
	Wed,  8 Jul 2020 18:35:23 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 068IZKBk023249 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 8 Jul 2020 14:35:20 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 09D771001B0B; Wed,  8 Jul 2020 18:35:20 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from localhost (unknown [10.18.25.174])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E761C100238C;
	Wed,  8 Jul 2020 18:35:16 +0000 (UTC)
Date: Wed, 8 Jul 2020 13:33:56 -0400
From: Mike Snitzer <snitzer@redhat.com>
To: Gabriel Krisman Bertazi <krisman@collabora.com>
Message-ID: <20200708173356.GA8116@redhat.com>
References: <alpine.LRH.2.02.2007081222500.4103@file01.intranet.prod.int.rdu2.redhat.com>
	<873661g8wq.fsf@collabora.com>
MIME-Version: 1.0
In-Reply-To: <873661g8wq.fsf@collabora.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-loop: dm-devel@redhat.com
Cc: Tahsin Erdogan <tahsin@google.com>, dm-devel@redhat.com,
	Mikulas Patocka <mpatocka@redhat.com>,
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Wed, Jul 08 2020 at  2:26pm -0400,
Gabriel Krisman Bertazi <krisman@collabora.com> wrote:

> Mikulas Patocka <mpatocka@redhat.com> writes:
> 
> > kobject_uevent may allocate memory and it may be called while there are dm
> > devices suspended. The allocation may recurse into a suspended device,
> > causing a deadlock. We must set the noio flag when sending a uevent.
> 
> If I understand it correctly, considering the deadlock you shared, this
> doesn't solve the entire issue. For instance, kobject_uevent_env on the
> GFP_NOIO thread waits on uevent_sock_mutex, and another thread with
> GFP_IO holding the mutex might have triggered the shrinker from inside
> kobject_uevent_net_broadcast.  I believe 7e7cd796f277 ("scsi: iscsi: Fix
> deadlock on recovery path during GFP_IO reclaim") solved the one you
> shared and other similar cases for iSCSI in a different way.

I staged a different fix, from Mikulas, for 5.9 that is meant to address
the original report, please see:
https://git.kernel.org/pub/scm/linux/kernel/git/device-mapper/linux-dm.git/commit/?h=dm-5.9&id=e5bfe9baf23dca211f4b794b651e871032c427ec

I'd appreciate it if you could try this commit to se if it fixes the
original issue you reported.

> I know this is similar to the log I shared on an earlier patch. Are you
> able to reproduce the deadlock with the above patch applied?

Mikulas seized on the fact that the backtrace shows the uevent upcall
to have occurred while suspending.  I know he didn't reproduce your
issue.

> That said, I think this patch is an improvement as we shouldn't be using
> GFP_IO in this path to begin with, so please add:
> 
> Reviewed-by: Gabriel Krisman Bertazi <krisman@collabora.com>

FYI, whilee I do appreciate your Reviewed-by I already staged this for
5.8 so I'd rather not rebase to add your Reviewed-by, see:
https://git.kernel.org/pub/scm/linux/kernel/git/device-mapper/linux-dm.git/commit/?h=dm-5.8&id=6958c1c640af8c3f40fa8a2eee3b5b905d95b677

Thanks,
Mike

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

