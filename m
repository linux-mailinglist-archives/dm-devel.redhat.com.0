Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 6986F66CF37
	for <lists+dm-devel@lfdr.de>; Mon, 16 Jan 2023 19:56:12 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1673895371;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=OZa1kfTZpSUZrkgFQ/tutngjL/BPMuNNCu4EoK9dLe4=;
	b=C7r3MJhCUyRGaoJs1sZruwqoWRSIUB1tlvcl7KS7VBaiqVxmq+sB3yj0Yt6HVo7iexjyhx
	h/KqnEQiQymxfQBLM5Vc6AKjGI/nklwEjJhnSC3ieioe/X5czD4wG4ZedjK93R6gYNBwXb
	nhTsX0qwsCmZO0BLVNI/+nUq5X9cVh0=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-99-BvEzcPJNMc2UUb0KBXuEXA-1; Mon, 16 Jan 2023 13:56:09 -0500
X-MC-Unique: BvEzcPJNMc2UUb0KBXuEXA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com [10.11.54.3])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1DCCA1C0040C;
	Mon, 16 Jan 2023 18:56:06 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 34B5E1121318;
	Mon, 16 Jan 2023 18:56:01 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 554B319465B7;
	Mon, 16 Jan 2023 18:56:00 +0000 (UTC)
X-Original-To: dm-devel@listman.corp.redhat.com
Delivered-To: dm-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 808841946589
 for <dm-devel@listman.corp.redhat.com>; Mon, 16 Jan 2023 18:55:58 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 4A861492B01; Mon, 16 Jan 2023 18:55:58 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from octiron.msp.redhat.com (octiron.msp.redhat.com [10.15.80.209])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 33A55492B00;
 Mon, 16 Jan 2023 18:55:58 +0000 (UTC)
Received: from octiron.msp.redhat.com (localhost.localdomain [127.0.0.1])
 by octiron.msp.redhat.com (8.14.9/8.14.9) with ESMTP id 30GItuc4014309;
 Mon, 16 Jan 2023 12:55:56 -0600
Received: (from bmarzins@localhost)
 by octiron.msp.redhat.com (8.14.9/8.14.9/Submit) id 30GItu59014308;
 Mon, 16 Jan 2023 12:55:56 -0600
Date: Mon, 16 Jan 2023 12:55:55 -0600
From: Benjamin Marzinski <bmarzins@redhat.com>
To: mwilck@suse.com
Message-ID: <20230116185555.GF17327@octiron.msp.redhat.com>
References: <20230113094310.20367-1-mwilck@suse.com>
MIME-Version: 1.0
In-Reply-To: <20230113094310.20367-1-mwilck@suse.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
Subject: Re: [dm-devel] [PATCH 0/2] multipath-tools fixes for GitHub
 reported issues
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
Cc: dm-devel@redhat.com
Errors-To: dm-devel-bounces@redhat.com
Sender: "dm-devel" <dm-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, Jan 13, 2023 at 10:43:08AM +0100, mwilck@suse.com wrote:
> From: Martin Wilck <mwilck@suse.com>
> 
> Two patches that originate from issues reported on GitHub.
> I couldn't figure out the email addresses of the reporters.

For the set,
Reviewed-by: Benjamin Marzinski <bmarzins@redhat.com>

> 
> Martin Wilck (2):
>   libmpathpersist: use conf->timeout for updating persistent
>     reservations
>   libmultipath: pathinfo: don't fail for devices lacking INQUIRY
>     properties
> 
>  libmpathpersist/mpath_updatepr.c | 11 ++++++++++-
>  libmultipath/discovery.c         | 22 +++++++++++++---------
>  2 files changed, 23 insertions(+), 10 deletions(-)
> 
> -- 
> 2.39.0
--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

