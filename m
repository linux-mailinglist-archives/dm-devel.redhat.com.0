Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id 1A2CD150E39
	for <lists+dm-devel@lfdr.de>; Mon,  3 Feb 2020 17:54:43 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1580748882;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=Ax6vNs0SFAjTM3DHLYXNQN7ODGMsEdmY4ipeUC5B7io=;
	b=FQlgqO3PyaTFwa3NbbhD0egDCw0h0KrMm97nx7EtRemWUH2uo4lN7L3BAHzt0I0tMfEPQc
	pEaqzoQjmkOKtafyB47s9+bgaVr4ns7fk29dTSZ/DnDwoA2GiC0GJHArcb8FIpNzpZ78JE
	7Mb2cukpFurLKfk4JYQweyFha4kieH4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-418-6XTU1ElaOu6S5rkvSFGLEQ-1; Mon, 03 Feb 2020 11:54:39 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4E39E107ACC4;
	Mon,  3 Feb 2020 16:54:31 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5240C8642F;
	Mon,  3 Feb 2020 16:54:29 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 8B59918089C8;
	Mon,  3 Feb 2020 16:54:19 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 013Gs8Lt015461 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 3 Feb 2020 11:54:08 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 80AFD5DA83; Mon,  3 Feb 2020 16:54:08 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from localhost (unknown [10.18.25.174])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0116D5D9CA;
	Mon,  3 Feb 2020 16:54:03 +0000 (UTC)
Date: Mon, 3 Feb 2020 11:54:02 -0500
From: Mike Snitzer <snitzer@redhat.com>
To: John Dorminy <jdorminy@redhat.com>
Message-ID: <20200203165402.GA11874@redhat.com>
References: <20200201005524.23405-1-jdorminy@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20200201005524.23405-1-jdorminy@redhat.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com, agk@redhat.com
Subject: Re: [dm-devel] dm: expose dm_copy_name_and_uuid()
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-MC-Unique: 6XTU1ElaOu6S5rkvSFGLEQ-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Fri, Jan 31 2020 at  7:55pm -0500,
John Dorminy <jdorminy@redhat.com> wrote:

> While dm_device_name() returns the MAJOR:MINOR numbers of a device,
> some targets would like to know the pretty name of a device, and
> some targets would like to know the uuid expected for the device.
> 
> The MAJOR:MINOR name is useful for logging, but printing the long
> name of the device can make it easier for the user to correlate
> messages with the device names they know in userspace.
> 
> The UUID can be useful for devices which store a UUID on disk, and
> would like to verify the on-disk UUID matches the UUID known by DM.
> 
> dm_copy_name_and_uuid() appears to be the only way to get at the
> pretty name and the UUID at present, and this change exports the
> function for use by GPLd modules.
> 
> Signed-off-by: John Dorminy <jdorminy@redhat.com>
> ---
>  drivers/md/dm-ioctl.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/md/dm-ioctl.c b/drivers/md/dm-ioctl.c
> index 1e03bc89e20f..711a46015696 100644
> --- a/drivers/md/dm-ioctl.c
> +++ b/drivers/md/dm-ioctl.c
> @@ -2018,7 +2018,7 @@ int dm_copy_name_and_uuid(struct mapped_device *md, char *name, char *uuid)
>  
>  	return r;
>  }
> -
> +EXPORT_SYMBOL_GPL(dm_copy_name_and_uuid);
>  
>  /**
>   * dm_early_create - create a mapped device in early boot.
> -- 
> 2.20.1

These are already available to userspace via sysfs, e.g.:

# dmsetup ls
test-test        (253:0)
# cat /sys/block/dm-0/dm/name
test-test
# cat /sys/block/dm-0/dm/uuid
LVM-IFFqf0id2DX3IgGmu6izzJW1rBoWmsC61hwGobtrD60aCMh6zJwK3uiYUS6rbNoY

Verification of the UUID that a target happens to store in its ondisk
metadata seems like it'd best be done by userspace, _before_ activating
the DM device, no?  Or are you saying that the target would do this
verification as part of its .ctr method?

Anyway, I'm fine with exporting it.. just think the proposed usecases
are not a "slam-dunk" for why you need it.

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

