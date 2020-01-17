Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id C0814141002
	for <lists+dm-devel@lfdr.de>; Fri, 17 Jan 2020 18:40:20 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1579282819;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=VKgXKgro3MksQq9FZDS10aeo+hQMnvSYJnp36J/XAVw=;
	b=iJ7IZlxAuBtCu30eNln8v4jNO37MbsiDdQSI8AT6Wg79It3a/GzFNuW+EBodMEwiu+uIDA
	/D9ZAez+oMsxZ/MCrtikR3yeKe2e50Pr3tL36XpEMjSlXWUjiVrnpBLRkCzTSsfrbnmcwz
	cZUvQozFLww87un/uKMjIuw0LHr5nv8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-77-BvgY95DuOTSXF0bScXkDVg-1; Fri, 17 Jan 2020 12:40:18 -0500
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 094A018CA241;
	Fri, 17 Jan 2020 17:40:12 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id CD36B10013A1;
	Fri, 17 Jan 2020 17:40:11 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 19AFA18089CD;
	Fri, 17 Jan 2020 17:40:11 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 00HHe5ii025156 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 17 Jan 2020 12:40:05 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 4F3112026983; Fri, 17 Jan 2020 17:40:05 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4AB2E2026D68
	for <dm-devel@redhat.com>; Fri, 17 Jan 2020 17:40:03 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4C8CE803B3F
	for <dm-devel@redhat.com>; Fri, 17 Jan 2020 17:40:03 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-338-uOP4lz30M3ynUuZSMJyrUA-1;
	Fri, 17 Jan 2020 12:40:01 -0500
Received: from relay2.suse.de (unknown [195.135.220.254])
	by mx2.suse.de (Postfix) with ESMTP id 0B26DAC46;
	Fri, 17 Jan 2020 17:39:59 +0000 (UTC)
Message-ID: <8b09d1ef0d4d4bf264e5e88f6ab51ebe84b0176d.camel@suse.de>
From: Martin Wilck <mwilck@suse.com>
To: Benjamin Marzinski <bmarzins@redhat.com>, Christophe Varoqui
	<christophe.varoqui@opensvc.com>
Date: Fri, 17 Jan 2020 18:41:15 +0100
In-Reply-To: <1579227500-17196-14-git-send-email-bmarzins@redhat.com>
References: <1579227500-17196-1-git-send-email-bmarzins@redhat.com>
	<1579227500-17196-14-git-send-email-bmarzins@redhat.com>
User-Agent: Evolution 3.34.3
MIME-Version: 1.0
X-MC-Unique: uOP4lz30M3ynUuZSMJyrUA-1
X-MC-Unique: BvgY95DuOTSXF0bScXkDVg-1
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 00HHe5ii025156
X-loop: dm-devel@redhat.com
Cc: device-mapper development <dm-devel@redhat.com>
Subject: Re: [dm-devel] [PATCH 13/15] libmultipath: add new checker class
	functions
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
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, 2020-01-16 at 20:18 -0600, Benjamin Marzinski wrote:
> This commit adds the optional functions libcheck_load,
> libcheck_unload,
> and libcheck_reset. libcheck_load is called when a checker is first
> loaded, libcheck_unload is called when it is unloaded, and
> libcheck_reset is called during reconfigure, after all the current
> paths have been removed. They are designed to setup, reset, and
> destroy
> global state that all checkers of this class use. They will be used
> in future commits.
> 
> Signed-off-by: Benjamin Marzinski <bmarzins@redhat.com>
> ---
>  libmultipath/checkers.c | 29 ++++++++++++++++++++++++++++-
>  libmultipath/checkers.h |  1 +
>  multipathd/main.c       |  1 +
>  3 files changed, 30 insertions(+), 1 deletion(-)
> 

Reviewed-by: Martin Wilck <mwilck@suse.com>



--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

