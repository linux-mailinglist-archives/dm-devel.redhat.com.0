Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 01AE779704A
	for <lists+dm-devel@lfdr.de>; Thu,  7 Sep 2023 08:27:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1694068062;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=W0yXaxOdcQYFlix3kNPndEKcXDIiYsXm4XlLO71+XkU=;
	b=ftrhjj7JAn5j+ca4wd1z+FNoiWMaBj9Gg7wG8+3Wz+HtWoIdRPRtj66+sMFOHU8S48lMRb
	pxQrFENUBlLi0Vnht+q2eL3sY3a8m43VjmXE3e2w+f8LjgyR8xb9ZnYAkPUB4Hk7iGTIBI
	Gqcmrx/okN0SroW7F7Df1YXO+La03ls=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-680-4ytywhGqOOCVYnvPjN6iYA-1; Thu, 07 Sep 2023 02:27:40 -0400
X-MC-Unique: 4ytywhGqOOCVYnvPjN6iYA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com [10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A0460101CA85;
	Thu,  7 Sep 2023 06:27:36 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 7D7132026D2C;
	Thu,  7 Sep 2023 06:27:35 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 5BC2219465B2;
	Thu,  7 Sep 2023 06:27:35 +0000 (UTC)
X-Original-To: dm-devel@listman.corp.redhat.com
Delivered-To: dm-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id B8B22194658C
 for <dm-devel@listman.corp.redhat.com>; Wed,  6 Sep 2023 15:45:06 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id A254DC03292; Wed,  6 Sep 2023 15:45:06 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast07.extmail.prod.ext.rdu2.redhat.com [10.11.55.23])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9AE36C15BB8
 for <dm-devel@redhat.com>; Wed,  6 Sep 2023 15:45:06 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-inbound-delivery-1.mimecast.com
 [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7F05D3C11A07
 for <dm-devel@redhat.com>; Wed,  6 Sep 2023 15:45:06 +0000 (UTC)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-237-oDv_TTCHNTSTaVcOH-r6qg-1; Wed,
 06 Sep 2023 11:45:04 -0400
X-MC-Unique: oDv_TTCHNTSTaVcOH-r6qg-1
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id 88B32CE16AC;
 Wed,  6 Sep 2023 15:39:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 52012C433C7;
 Wed,  6 Sep 2023 15:38:58 +0000 (UTC)
Date: Wed, 6 Sep 2023 17:38:55 +0200
From: Christian Brauner <brauner@kernel.org>
To: "Darrick J. Wong" <djwong@kernel.org>
Message-ID: <20230906-alteingesessen-fussball-b480d6514411@brauner>
References: <59b54cc3-b98b-aff9-14fc-dc25c61111c6@redhat.com>
 <20230906152245.GD28160@frogsfrogsfrogs>
MIME-Version: 1.0
In-Reply-To: <20230906152245.GD28160@frogsfrogsfrogs>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
X-Mailman-Approved-At: Thu, 07 Sep 2023 06:27:31 +0000
Subject: Re: [dm-devel] [PATCH] fix writing to the filesystem after unmount
X-BeenThere: dm-devel@redhat.com
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: device-mapper development <dm-devel.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/dm-devel>,
 <mailto:dm-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <http://listman.redhat.com/archives/dm-devel/>
List-Post: <mailto:dm-devel@redhat.com>
List-Help: <mailto:dm-devel-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/dm-devel>,
 <mailto:dm-devel-request@redhat.com?subject=subscribe>
Cc: linux-kernel@vger.kernel.org, dm-devel@redhat.com,
 Mikulas Patocka <mpatocka@redhat.com>,
 Alexander Viro <viro@zeniv.linux.org.uk>, Zdenek Kabelac <zkabelac@redhat.com>,
 linux-fsdevel@vger.kernel.org
Errors-To: dm-devel-bounces@redhat.com
Sender: "dm-devel" <dm-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: kernel.org
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, Sep 06, 2023 at 08:22:45AM -0700, Darrick J. Wong wrote:
> On Wed, Sep 06, 2023 at 03:26:21PM +0200, Mikulas Patocka wrote:
> > lvm may suspend any logical volume anytime. If lvm suspend races with
> > unmount, it may be possible that the kernel writes to the filesystem after
> > unmount successfully returned. The problem can be demonstrated with this
> > script:
> > 
> > #!/bin/sh -ex
> > modprobe brd rd_size=4194304
> > vgcreate vg /dev/ram0
> > lvcreate -L 16M -n lv vg
> > mkfs.ext4 /dev/vg/lv
> > mount -t ext4 /dev/vg/lv /mnt/test
> > dmsetup suspend /dev/vg/lv
> > (sleep 1; dmsetup resume /dev/vg/lv) &
> > umount /mnt/test
> > md5sum /dev/vg/lv
> > md5sum /dev/vg/lv
> > dmsetup remove_all
> > rmmod brd
> > 
> > The script unmounts the filesystem and runs md5sum twice, the result is
> > that these two invocations return different hash.
> > 
> > What happens:
> > * dmsetup suspend calls freeze_bdev, that goes to freeze_super and it
> >   increments sb->s_active
> > * then we unmount the filesystem, we go to cleanup_mnt, cleanup_mnt calls
> >   deactivate_super, deactivate_super sees that sb->s_active is 2, so it
> >   decreases it to 1 and does nothing - the umount syscall returns
> >   successfully
> > * now we have a mounted filesystem despite the fact that umount returned
> > * we call md5sum, this waits for the block device being unblocked
> > * dmsetup resume unblocks the block device and calls thaw_bdev, that calls
> >   thaw_super and thaw_super_locked
> > * thaw_super_locked calls deactivate_locked_super, this actually drops the
> >   refcount and performs the unmount. The unmount races with md5sum. md5sum
> >   wins the race and it returns the hash of the filesystem before it was
> >   unmounted
> > * the second md5sum returns the hash after the filesystem was unmounted
> > 
> > In order to fix this bug, this patch introduces a new function
> > wait_and_deactivate_super that will wait if the filesystem is frozen and
> > perform deactivate_locked_super only after that.
> > 
> > Signed-off-by: Mikulas Patocka <mpatocka@redhat.com>
> > Cc: stable@vger.kernel.org
> > 
> > ---
> >  fs/namespace.c     |    2 +-
> >  fs/super.c         |   20 ++++++++++++++++++++
> >  include/linux/fs.h |    1 +
> >  3 files changed, 22 insertions(+), 1 deletion(-)
> > 
> > Index: linux-2.6/fs/namespace.c
> > ===================================================================
> > --- linux-2.6.orig/fs/namespace.c	2023-09-06 09:45:54.000000000 +0200
> > +++ linux-2.6/fs/namespace.c	2023-09-06 09:47:15.000000000 +0200
> > @@ -1251,7 +1251,7 @@ static void cleanup_mnt(struct mount *mn
> >  	}
> >  	fsnotify_vfsmount_delete(&mnt->mnt);
> >  	dput(mnt->mnt.mnt_root);
> > -	deactivate_super(mnt->mnt.mnt_sb);
> > +	wait_and_deactivate_super(mnt->mnt.mnt_sb);
> >  	mnt_free_id(mnt);
> >  	call_rcu(&mnt->mnt_rcu, delayed_free_vfsmnt);
> >  }
> > Index: linux-2.6/fs/super.c
> > ===================================================================
> > --- linux-2.6.orig/fs/super.c	2023-09-05 21:09:16.000000000 +0200
> > +++ linux-2.6/fs/super.c	2023-09-06 09:52:20.000000000 +0200
> > @@ -36,6 +36,7 @@
> >  #include <linux/lockdep.h>
> >  #include <linux/user_namespace.h>
> >  #include <linux/fs_context.h>
> > +#include <linux/delay.h>
> >  #include <uapi/linux/mount.h>
> >  #include "internal.h"
> >  
> > @@ -365,6 +366,25 @@ void deactivate_super(struct super_block
> >  EXPORT_SYMBOL(deactivate_super);
> >  
> >  /**
> > + *	wait_and_deactivate_super	-	wait for unfreeze and drop a reference
> > + *	@s: superblock to deactivate
> > + *
> > + *	Variant of deactivate_super(), except that we wait if the filesystem is
> > + *	frozen. This is required on unmount, to make sure that the filesystem is
> > + *	really unmounted when this function returns.
> > + */
> > +void wait_and_deactivate_super(struct super_block *s)
> > +{
> > +	down_write(&s->s_umount);
> > +	while (s->s_writers.frozen != SB_UNFROZEN) {
> > +		up_write(&s->s_umount);
> > +		msleep(1);
> > +		down_write(&s->s_umount);
> > +	}
> 
> Instead of msleep, could you use wait_var_event_killable like
> wait_for_partially_frozen() does?

I said the same thing but I think that the patch in this way isn't a
good idea and technically also uapi breakage. Anyway, can you take a
look at my third response here?

https://lore.kernel.org/lkml/20230906-aufheben-hagel-9925501b7822@brauner

(I forgot you worked on freezing as well.
I'm currently moving the freezing bits to fs_holder_ops
https://gitlab.com/brauner/linux/-/commits/vfs.super.freeze)

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

