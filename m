Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id 85A08140F93
	for <lists+dm-devel@lfdr.de>; Fri, 17 Jan 2020 18:03:15 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1579280594;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=pIz6uFaszlG+jDcmEABZsHVEY1+S5FifIx37nw8Yl08=;
	b=TLROrRN1atOSrB3qynjR6s9C3JKJ5b4dulW/VObvzk/rc7xqeA5mjPHE4DnAk9WNMFCl5q
	AiNhviG52I62ZpqrwzhkaSyiD4krKs9Y4VUi0O25QRuRqkK1++O+PFIXmwwpc4EjMXHOu4
	TKAZSqQSPm3EZINNGyVc8poNV7cFG5Y=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-330-rKmFxHPBO7CGRMmdvIVpKw-1; Fri, 17 Jan 2020 12:03:12 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 100DD1005513;
	Fri, 17 Jan 2020 17:03:06 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 59D9C48;
	Fri, 17 Jan 2020 17:03:05 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id BC8FB18089CD;
	Fri, 17 Jan 2020 17:03:02 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 00HH2ukm022807 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 17 Jan 2020 12:02:57 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id D24DF2166B2A; Fri, 17 Jan 2020 17:02:56 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id CE2502166B29
	for <dm-devel@redhat.com>; Fri, 17 Jan 2020 17:02:54 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id BA3A781C892
	for <dm-devel@redhat.com>; Fri, 17 Jan 2020 17:02:54 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-404-JIV0W-0_MF2MK33aTlUzww-1;
	Fri, 17 Jan 2020 12:02:51 -0500
Received: from relay2.suse.de (unknown [195.135.220.254])
	by mx2.suse.de (Postfix) with ESMTP id 62034AB6D;
	Fri, 17 Jan 2020 17:02:49 +0000 (UTC)
Message-ID: <f0b452a278052a9f9b1cc49c59005544ce07cd90.camel@suse.de>
From: Martin Wilck <mwilck@suse.com>
To: Benjamin Marzinski <bmarzins@redhat.com>, Christophe Varoqui
	<christophe.varoqui@opensvc.com>
Date: Fri, 17 Jan 2020 18:04:05 +0100
In-Reply-To: <1579227500-17196-11-git-send-email-bmarzins@redhat.com>
References: <1579227500-17196-1-git-send-email-bmarzins@redhat.com>
	<1579227500-17196-11-git-send-email-bmarzins@redhat.com>
User-Agent: Evolution 3.34.3
MIME-Version: 1.0
X-MC-Unique: JIV0W-0_MF2MK33aTlUzww-1
X-MC-Unique: rKmFxHPBO7CGRMmdvIVpKw-1
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 00HH2ukm022807
X-loop: dm-devel@redhat.com
Cc: device-mapper development <dm-devel@redhat.com>
Subject: Re: [dm-devel] [PATCH 10/15] libmultipath: change how the checker
	async is set
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

On Thu, 2020-01-16 at 20:18 -0600, Benjamin Marzinski wrote:
> The way that the checkers async mode worked in multipathd didn't make
> much sense. When multipathd starts up, all checker classes are in the
> sync mode, and any pathinfo() calls on devices would run the checker
> in
> sync mode. However, the First time a checker class was used in
> checkerloop, it would set that checker class to async (assuming
> force_sync wasn't set).  After that, no matter when a checker from
> that
> class was called, it would always run in async mode.  Multipathd
> doesn't
> need to run checkers in sync mode at all, so don't.
> 
> Signed-off-by: Benjamin Marzinski <bmarzins@redhat.com>
> ---
>  libmpathpersist/mpath_persist.c |  2 +-
>  libmultipath/discovery.c        | 10 ++++------
>  multipath/main.c                |  1 +
>  3 files changed, 6 insertions(+), 7 deletions(-)
> 

Reviewed-by: Martin Wilck <mwilck@suse.com>




--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

