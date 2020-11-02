Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id DF1BE2A36AA
	for <lists+dm-devel@lfdr.de>; Mon,  2 Nov 2020 23:41:24 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1604356884;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=jBtC4W4SQIuTzl0Qs3hG3I4mmX4s2pDff3mJp1RKvXY=;
	b=AGt0SOFjWrMF5U45PFPGAr0gNB7+OaxhpEnjQU5iCsBCJFaTAi/n/vG/xrPIXLcMrLNtzF
	8Tn3JFpZ6xEjHNuI2eX3Q4hrqeVBaIbW4CpvisIX9ehlW/H+ypolXf9grqx58Xu5PCLG2X
	gdVU0vIrulyEMHzROlWeL8ziE0KjHZ4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-431-PqrmJsc2MTqCXiagWmXrCw-1; Mon, 02 Nov 2020 17:41:21 -0500
X-MC-Unique: PqrmJsc2MTqCXiagWmXrCw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0C1811868406;
	Mon,  2 Nov 2020 22:41:14 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 827D85D9DD;
	Mon,  2 Nov 2020 22:41:10 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 88DD3180B657;
	Mon,  2 Nov 2020 22:41:03 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0A2Merii021429 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 2 Nov 2020 17:40:53 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id A2BFB5B4D3; Mon,  2 Nov 2020 22:40:53 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from octiron.msp.redhat.com (octiron.msp.redhat.com [10.15.80.209])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9346B5B4A5;
	Mon,  2 Nov 2020 22:40:50 +0000 (UTC)
Received: from octiron.msp.redhat.com (localhost.localdomain [127.0.0.1])
	by octiron.msp.redhat.com (8.14.9/8.14.9) with ESMTP id 0A2MenbA012420; 
	Mon, 2 Nov 2020 16:40:49 -0600
Received: (from bmarzins@localhost)
	by octiron.msp.redhat.com (8.14.9/8.14.9/Submit) id 0A2Memfw012419;
	Mon, 2 Nov 2020 16:40:48 -0600
Date: Mon, 2 Nov 2020 16:40:48 -0600
From: Benjamin Marzinski <bmarzins@redhat.com>
To: Martin Wilck <mwilck@suse.com>
Message-ID: <20201102224048.GV3384@octiron.msp.redhat.com>
References: <e77c4409175db94f97543991632c323a78ab3ef9.camel@suse.com>
MIME-Version: 1.0
In-Reply-To: <e77c4409175db94f97543991632c323a78ab3ef9.camel@suse.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-loop: dm-devel@redhat.com
Cc: Hannes Reinecke <hare@suse.com>,
	dm-devel mailing list <dm-devel@redhat.com>
Subject: Re: [dm-devel] Thoughts about multipathd's log thread
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
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, Nov 02, 2020 at 01:17:28PM +0100, Martin Wilck wrote:
> (sending again, with dm-devel on cc. Sorry!)
> 
> Hi Ben, hi Christophe,
> 
> AFAIU, the purpose of the log thread is to avoid blocking while writing
> log messages to the syslog socket. The thread has been in place for a
> long time. However, the large majority of multipath installations today
> runs on systemd-enabled systems, where we don't use the log thread.
> Rather, we write to stderr (which is actually a journald socket)
> directly.
> 
> That makes me wonder: if the problem of blocking while writing to the
> log socket is real, it should happen with journald as well (possibly
> more so than with syslogd; journald doesn't exactly have the reputation
> of being highly efficient). Thus, we should be using the log thread
> also for the systemd case

It does seem sort of wasteful to me to have a thread buffering writes to
a daemon that itself buffers writes. If journald is blocking logging
processes from continuing, that's a big problem, and not just for
multipath. Obviously multipathd, or at the very least, path checking, is
supposed to continue working when there is no access to the root
filesystem, which is a stricter requirement than other programs have.
But IO delays happen, and journald better be decoupling them from the
logging process. I have seen journald drop log messages, presumably
because it isn't just blocking everything that wants to log to it.

>  OTOH, I'm not aware of any bug reports
> saying that multipathd wasn't able to handle events because of blocking
> log calls. So perhaps the issue is rather theoretical? In that case, we
> could do away with all the complexity the log thread involves.
> 
> What do you think?

I do believe that syslog is allowed to block the caller, but I agree
that we've mostly moved on to a systemd world where multipathd is
writing to stderr. Removing this will make multipathd run a real risk of
hanging on logging when not run through systemd. I just don't know how
likely that scenario is anymore.

-Ben

> Martin
> 
> 

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

