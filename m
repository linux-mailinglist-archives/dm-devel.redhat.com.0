Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 752306BBF89
	for <lists+dm-devel@lfdr.de>; Wed, 15 Mar 2023 23:02:01 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1678917720;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=s02Wu8MC8q1ICD6sBDPqPx84XY6y3x4uIRqqesErtcM=;
	b=a7GhNFZdZEsiurJ2XVdFj7yZsJer0VEi7NOpylAq7Q/kwUm3GIuBaaBRFiSNWWnUPBD409
	harmcy1zTvPiHvXn7kEBnW1VWj+uDggN5b7pRDVVXYcWlyAgsXGFbW5Qc+yUhNJDcSjFCH
	gXZ8Vtn0ATHjj4E5x3XHVk+M0TPuPLk=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-529-1np9NeI3MXyazcgk4ePIKw-1; Wed, 15 Mar 2023 18:01:58 -0400
X-MC-Unique: 1np9NeI3MXyazcgk4ePIKw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4FDC98314EC;
	Wed, 15 Mar 2023 22:01:55 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 55FEF140E991;
	Wed, 15 Mar 2023 22:01:48 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 7934A1946A49;
	Wed, 15 Mar 2023 22:01:47 +0000 (UTC)
X-Original-To: dm-devel@listman.corp.redhat.com
Delivered-To: dm-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 3DE0F1946597
 for <dm-devel@listman.corp.redhat.com>; Wed, 15 Mar 2023 22:01:33 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 23FC040AE2C1; Wed, 15 Mar 2023 22:01:33 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from octiron.msp.redhat.com (octiron.msp.redhat.com [10.15.80.209])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 0B58340AE2C0;
 Wed, 15 Mar 2023 22:01:33 +0000 (UTC)
Received: from octiron.msp.redhat.com (localhost.localdomain [127.0.0.1])
 by octiron.msp.redhat.com (8.14.9/8.14.9) with ESMTP id 32FM1VsH013935;
 Wed, 15 Mar 2023 17:01:32 -0500
Received: (from bmarzins@localhost)
 by octiron.msp.redhat.com (8.14.9/8.14.9/Submit) id 32FM1VwL013934;
 Wed, 15 Mar 2023 17:01:31 -0500
Date: Wed, 15 Mar 2023 17:01:31 -0500
From: Benjamin Marzinski <bmarzins@redhat.com>
To: Xose Vazquez Perez <xose.vazquez@gmail.com>
Message-ID: <20230315220131.GE19878@octiron.msp.redhat.com>
References: <20230315170209.13886-1-xose.vazquez@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20230315170209.13886-1-xose.vazquez@gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
Subject: Re: [dm-devel] [PATCH] multipath-tools: delete
 multipathd/multipathc.d file when "make clean"
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
Cc: DM-DEVEL ML <dm-devel@redhat.com>, Martin Wilck <mwilck@suse.com>
Errors-To: dm-devel-bounces@redhat.com
Sender: "dm-devel" <dm-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, Mar 15, 2023 at 06:02:09PM +0100, Xose Vazquez Perez wrote:
> Cc: Martin Wilck <mwilck@suse.com>
> Cc: Benjamin Marzinski <bmarzins@redhat.com>
> Cc: Christophe Varoqui <christophe.varoqui@opensvc.com>
> Cc: DM-DEVEL ML <dm-devel@redhat.com>
> Signed-off-by: Xose Vazquez Perez <xose.vazquez@gmail.com>

Shouldn't this also go in the include line?

-Ben

> ---
>  multipathd/Makefile | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/multipathd/Makefile b/multipathd/Makefile
> index 9d531329..ba879102 100644
> --- a/multipathd/Makefile
> +++ b/multipathd/Makefile
> @@ -79,7 +79,7 @@ uninstall:
>  	$(Q)$(RM) $(DESTDIR)$(unitdir)/$(EXEC).socket
>  
>  clean: dep_clean
> -	$(Q)$(RM) core *.o $(EXEC) $(CLI)
> +	$(Q)$(RM) core *.o $(EXEC) $(CLI) multipathc.d
>  
>  include $(wildcard $(OBJS:.o=.d))
>  
> -- 
> 2.40.0
--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

