Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id 15B5F2A4992
	for <lists+dm-devel@lfdr.de>; Tue,  3 Nov 2020 16:28:11 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1604417291;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=YG++m1y8i8sTv9aC8MiahN32SEGfUPG/jTnXRlgnAvI=;
	b=ImBQZebZ11M5j3JmFL0eXf8qv8ydZjX+W2bs88CkN4WvqAxcGe27Dj44MKTuUDVJqdXKgn
	FG4WyjdDsM9bWyA3ogIHl7SDEwUL4l0NhzT+8IhqMYmN9dNRYzKHpzdftpmzUXJf1JTqGf
	HtaR9v1teAtL2dvGw+d05xGO0a9i0r4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-248-2GXvVfKnOGyTjn33DBMg9w-1; Tue, 03 Nov 2020 10:28:09 -0500
X-MC-Unique: 2GXvVfKnOGyTjn33DBMg9w-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 39CC780ED80;
	Tue,  3 Nov 2020 15:28:03 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C770D5C3E0;
	Tue,  3 Nov 2020 15:27:58 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id D7C6685CD;
	Tue,  3 Nov 2020 15:27:50 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0A3FRhs0004381 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 3 Nov 2020 10:27:43 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 777C05B4DB; Tue,  3 Nov 2020 15:27:43 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from octiron.msp.redhat.com (octiron.msp.redhat.com [10.15.80.209])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 074DE5B4BB;
	Tue,  3 Nov 2020 15:27:39 +0000 (UTC)
Received: from octiron.msp.redhat.com (localhost.localdomain [127.0.0.1])
	by octiron.msp.redhat.com (8.14.9/8.14.9) with ESMTP id 0A3FRcvs018329; 
	Tue, 3 Nov 2020 09:27:38 -0600
Received: (from bmarzins@localhost)
	by octiron.msp.redhat.com (8.14.9/8.14.9/Submit) id 0A3FRcUv018328;
	Tue, 3 Nov 2020 09:27:38 -0600
Date: Tue, 3 Nov 2020 09:27:37 -0600
From: Benjamin Marzinski <bmarzins@redhat.com>
To: Martin Wilck <mwilck@suse.com>
Message-ID: <20201103152737.GA3384@octiron.msp.redhat.com>
References: <e77c4409175db94f97543991632c323a78ab3ef9.camel@suse.com>
	<20201102224048.GV3384@octiron.msp.redhat.com>
	<fed18c11d722606170f8bc521a49fdf77f67753d.camel@suse.com>
MIME-Version: 1.0
In-Reply-To: <fed18c11d722606170f8bc521a49fdf77f67753d.camel@suse.com>
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, Nov 03, 2020 at 09:27:13AM +0100, Martin Wilck wrote:
> On Mon, 2020-11-02 at 16:40 -0600, Benjamin Marzinski wrote:
> > 
> > I do believe that syslog is allowed to block the caller, but I agree
> > that we've mostly moved on to a systemd world where multipathd is
> > writing to stderr. Removing this will make multipathd run a real risk
> > of
> > hanging on logging when not run through systemd. I just don't know
> > how
> > likely that scenario is anymore.
> 
> So, you really think that journald is doing a better job at not
> blocking clients than syslogd? Wouldn't syslogd be truly optimized for
> exactly this use case? Being "allowed" to block clients is one thing,
> actually doing it is another.

Fair enough. It probably is coming down to a difference in honesty in
documentation. At any rate, I have never seen a bug that pointed towards
multipathd hanging on logging.

-Ben

> 
> Martin
> 
> 
> 
> 

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

