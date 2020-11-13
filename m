Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id B91122B240A
	for <lists+dm-devel@lfdr.de>; Fri, 13 Nov 2020 19:52:14 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1605293533;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=uI5A/ft9CCwGqiMlUr/7xBp1iVizbTQ2VzHxfK0v8p8=;
	b=JMrn2s/AXaFfyB/srHzaRE3GOExopHVo9Y/Pl8XE1XEO2OHi3XsqAK5RuPxBZJzpcyUsb5
	DAwdYGrUx/iw+7wd9awrvaeuMXL4HTb7HRCAOYG7fJax/TA9V69Ww6/wkw1EXC5jykQroB
	ReJvOPQw4YLgJchTsRkD+A7guuDMGpY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-301-L2bkQBz0NK-Rb-6xbO6Sig-1; Fri, 13 Nov 2020 13:52:11 -0500
X-MC-Unique: L2bkQBz0NK-Rb-6xbO6Sig-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1934064161;
	Fri, 13 Nov 2020 18:52:03 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 75D0119C66;
	Fri, 13 Nov 2020 18:51:59 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id B3D3558104;
	Fri, 13 Nov 2020 18:51:48 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0ADIpaKv011763 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 13 Nov 2020 13:51:36 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 13E196EF4A; Fri, 13 Nov 2020 18:51:36 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from localhost (unknown [10.18.25.174])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E720C6EF48;
	Fri, 13 Nov 2020 18:51:32 +0000 (UTC)
Date: Fri, 13 Nov 2020 13:51:31 -0500
From: Mike Snitzer <snitzer@redhat.com>
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Message-ID: <20201113185131.GA3671@redhat.com>
References: <20201113141910.2215071-1-bigeasy@linutronix.de>
MIME-Version: 1.0
In-Reply-To: <20201113141910.2215071-1-bigeasy@linutronix.de>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com, Thomas Gleixner <tglx@linutronix.de>,
	Alasdair Kergon <agk@redhat.com>
Subject: Re: [dm-devel] dm table: Remove BUG_ON(in_interrupt())
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
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, Nov 13 2020 at  9:19am -0500,
Sebastian Andrzej Siewior <bigeasy@linutronix.de> wrote:

> From: Thomas Gleixner <tglx@linutronix.de>
> 
> The BUG_ON(in_interrupt()) in dm_table_event() is a historic leftover from
> a rework of the dm table code which changed the calling context.
> 
> Issuing a BUG for a wrong calling context is frowned upon and
> in_interrupt() is deprecated and only covering parts of the wrong
> contexts. The sanity check for the context is covered by
> CONFIG_DEBUG_ATOMIC_SLEEP and other debug facilities already.
> 
> Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
> Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
> Cc: dm-devel@redhat.com
> Cc: Mike Snitzer <snitzer@redhat.com>
> Cc: Alasdair Kergon <agk@redhat.com>

I picked this up for 5.11, thanks.

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

