Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 4E69313160A
	for <lists+dm-devel@lfdr.de>; Mon,  6 Jan 2020 17:29:13 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1578328152;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=1geK1VqBSn9ipi5apGAeBj/HD5sxc938cEZ69hNDfmM=;
	b=aVqe7klRJz350Rs8i721OymG645R3LYEnEyYHa6q4AQxdzIDvFjTNB9OmEv6YAfFRGt6w0
	xjrvwEsDRLzkhAPOuzQWLzCgKk/Gz4NAGCYzYVKBlZBs8641B0qrpxfaCMHCpeO0dYH6Jh
	AhlDOrd/zRUpmGa29989scIwrE6y7Cc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-387-p0bmmjT3MlqR_RtEXAJX8A-1; Mon, 06 Jan 2020 11:29:10 -0500
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 60448107ACC7;
	Mon,  6 Jan 2020 16:29:03 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 121DC10840F5;
	Mon,  6 Jan 2020 16:28:59 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id EE1DD180880B;
	Mon,  6 Jan 2020 16:28:50 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 006GSb7T018355 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 6 Jan 2020 11:28:37 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 3A4FF858B5; Mon,  6 Jan 2020 16:28:37 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from localhost (unknown [10.18.25.174])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 26A16858BE;
	Mon,  6 Jan 2020 16:28:34 +0000 (UTC)
Date: Mon, 6 Jan 2020 11:28:33 -0500
From: Mike Snitzer <snitzer@redhat.com>
To: Gabriel Krisman Bertazi <krisman@collabora.com>
Message-ID: <20200106162833.GA15829@redhat.com>
References: <20200102224512.3605010-1-krisman@collabora.com>
MIME-Version: 1.0
In-Reply-To: <20200102224512.3605010-1-krisman@collabora.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-loop: dm-devel@redhat.com
Cc: Bharath Ravi <rbharath@google.com>, Khazhismel Kumykov <khazhy@google.com>,
	dm-devel@redhat.com, Anatol Pomazau <anatol@google.com>,
	kernel@collabora.com, Frank Mayhar <fmayhar@google.com>, agk@redhat.com
Subject: Re: [dm-devel] dm mpath: Add timeout mechanism for queue_if_no_path
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
X-MC-Unique: p0bmmjT3MlqR_RtEXAJX8A-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Thu, Jan 02 2020 at  5:45pm -0500,
Gabriel Krisman Bertazi <krisman@collabora.com> wrote:

> From: Anatol Pomazau <anatol@google.com>
> 
> Add a configurable timeout mechanism to disable queue_if_no_path without
> assistance from multipathd.  In reality, this reimplements the
> no_path_retry mechanism from multipathd in kernel space, which is
> interesting for cases where we cannot rely on a daemon being present all
> the time, in case of failure or to reduce the guest footprint of cloud
> services.
> 
> Despite replicating the policy configuration on kernel space, it is
> quite an important case to prevent IOs from hanging forever, waiting for
> userspace to behave correctly.
> 
> Co-developed-by: Frank Mayhar <fmayhar@google.com>
> Signed-off-by: Frank Mayhar <fmayhar@google.com>
> Co-developed-by: Bharath Ravi <rbharath@google.com>
> Signed-off-by: Bharath Ravi <rbharath@google.com>
> Co-developed-by: Khazhismel Kumykov <khazhy@google.com>
> Signed-off-by: Khazhismel Kumykov <khazhy@google.com>
> Signed-off-by: Anatol Pomazau <anatol@google.com>
> Co-developed-by: Gabriel Krisman Bertazi <krisman@collabora.com>
> Signed-off-by: Gabriel Krisman Bertazi <krisman@collabora.com>

This seems like a slippery slope.

I've heard this line of dm-multipath concern from Google before
(e.g. doesn't want to rely on availability of userspace component).

Thing is, to properly use dm-multipath (e.g. to reinstate failed paths)
multipathd really is needed no?

If not, how is it that the proposed patch is all that is missing when
multipathd isn't running?  I find that hard to appreciate.

So I'm inclined to not accept this type of change.  But especially not
until more comprehensive context is given for how Google is using
dm-multipath without multipathd.

Thanks,
Mike

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

