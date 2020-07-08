Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id E1D572190DF
	for <lists+dm-devel@lfdr.de>; Wed,  8 Jul 2020 21:37:57 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-200-muTigMA3NWuNj3vaFh4KAw-1; Wed, 08 Jul 2020 15:37:54 -0400
X-MC-Unique: muTigMA3NWuNj3vaFh4KAw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3D1AC19253C0;
	Wed,  8 Jul 2020 19:37:46 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D46CA1A7CA;
	Wed,  8 Jul 2020 19:37:42 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 0D04193F7B;
	Wed,  8 Jul 2020 19:37:32 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 068JbIQ6030482 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 8 Jul 2020 15:37:19 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 85D802EF94; Wed,  8 Jul 2020 19:37:18 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1E81E8144
	for <dm-devel@redhat.com>; Wed,  8 Jul 2020 19:37:15 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 29D268007DD
	for <dm-devel@redhat.com>; Wed,  8 Jul 2020 19:37:15 +0000 (UTC)
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
	[46.235.227.227]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-34-tuhxzi5LMi2b8f2JJ1bpBg-1; Wed, 08 Jul 2020 15:37:12 -0400
X-MC-Unique: tuhxzi5LMi2b8f2JJ1bpBg-1
Received: from [127.0.0.1] (localhost [127.0.0.1])
	(Authenticated sender: krisman) with ESMTPSA id 1A55427E5DF
From: Gabriel Krisman Bertazi <krisman@collabora.com>
To: Mike Snitzer <snitzer@redhat.com>
Organization: Collabora
References: <alpine.LRH.2.02.2007081222500.4103@file01.intranet.prod.int.rdu2.redhat.com>
	<873661g8wq.fsf@collabora.com> <20200708173356.GA8116@redhat.com>
Date: Wed, 08 Jul 2020 15:37:07 -0400
In-Reply-To: <20200708173356.GA8116@redhat.com> (Mike Snitzer's message of
	"Wed, 8 Jul 2020 13:33:56 -0400")
Message-ID: <87v9ixer30.fsf@collabora.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.3 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Mike Snitzer <snitzer@redhat.com> writes:

> On Wed, Jul 08 2020 at  2:26pm -0400,
> Gabriel Krisman Bertazi <krisman@collabora.com> wrote:
>
>> If I understand it correctly, considering the deadlock you shared, this
>> doesn't solve the entire issue. For instance, kobject_uevent_env on the
>> GFP_NOIO thread waits on uevent_sock_mutex, and another thread with
>> GFP_IO holding the mutex might have triggered the shrinker from inside
>> kobject_uevent_net_broadcast.  I believe 7e7cd796f277 ("scsi: iscsi: Fix
>> deadlock on recovery path during GFP_IO reclaim") solved the one you
>> shared and other similar cases for iSCSI in a different way.
>
> I staged a different fix, from Mikulas, for 5.9 that is meant to address
> the original report, please see:
> https://git.kernel.org/pub/scm/linux/kernel/git/device-mapper/linux-dm.git/commit/?h=dm-5.9&id=e5bfe9baf23dca211f4b794b651e871032c427ec
>
> I'd appreciate it if you could try this commit to se if it fixes the
> original issue you reported.

I reverted 7e7cd796f277 and cherry-picked e5bfe9baf23dc on my tree.
After a few iterations, I could see the conditions that formerly
triggered the deadlock happening, but this patch successfully allowed
the reclaim to succeed and the iscsi recovery thread to run.

My reproducer is a bit artificial, as I wrote it only from only the
problem description provided by google.  They were hitting this in
production and might have a better final word on the fix, though I know
they don't have a simple way to reproduce it.

>> That said, I think this patch is an improvement as we shouldn't be using
>> GFP_IO in this path to begin with, so please add:
>> 
>> Reviewed-by: Gabriel Krisman Bertazi <krisman@collabora.com>
>
> FYI, whilee I do appreciate your Reviewed-by I already staged this for
> 5.8 so I'd rather not rebase to add your Reviewed-by, see:
> https://git.kernel.org/pub/scm/linux/kernel/git/device-mapper/linux-dm.git/commit/?h=dm-5.8&id=6958c1c640af8c3f40fa8a2eee3b5b905d95b677

No worries.  Actually, thank you guys for helping with this issue.

-- 
Gabriel Krisman Bertazi

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

