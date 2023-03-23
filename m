Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 112106C6B2B
	for <lists+dm-devel@lfdr.de>; Thu, 23 Mar 2023 15:36:55 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1679582214;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=Q/JEQlAff/gW5l2OYjy1Ugj4BAoZPM1VvlJxTDI+cyY=;
	b=GKregFsjistBMBbDLlB0VAvHAeEnjZnnL2RCDWUGgQj4XEONb5Thvn0/y2lCMwf+zBkAD9
	OEOfXw94bq6X86i8HZVtoCuh4BmJMXCZ1q+PcwwrjyAfxKNzESIDmlZSoQsl6Vl8eAYLXw
	5GwO9kaqFtWHB2ZJYbt36oS8LFoTtx0=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-646-1pFSRfe_NR6q0TTDAKu88Q-1; Thu, 23 Mar 2023 10:36:51 -0400
X-MC-Unique: 1pFSRfe_NR6q0TTDAKu88Q-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 13E1F855304;
	Thu, 23 Mar 2023 14:36:49 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 8843751FF;
	Thu, 23 Mar 2023 14:36:46 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 743F31946A44;
	Thu, 23 Mar 2023 14:36:35 +0000 (UTC)
X-Original-To: dm-devel@listman.corp.redhat.com
Delivered-To: dm-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 7FEC61946587
 for <dm-devel@listman.corp.redhat.com>; Thu, 23 Mar 2023 14:36:33 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 625C0483EC4; Thu, 23 Mar 2023 14:36:33 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from octiron.msp.redhat.com (octiron.msp.redhat.com [10.15.80.209])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4A1AB463E02;
 Thu, 23 Mar 2023 14:36:33 +0000 (UTC)
Received: from octiron.msp.redhat.com (localhost.localdomain [127.0.0.1])
 by octiron.msp.redhat.com (8.14.9/8.14.9) with ESMTP id 32NEaWck028903;
 Thu, 23 Mar 2023 09:36:32 -0500
Received: (from bmarzins@localhost)
 by octiron.msp.redhat.com (8.14.9/8.14.9/Submit) id 32NEaVef028902;
 Thu, 23 Mar 2023 09:36:31 -0500
Date: Thu, 23 Mar 2023 09:36:31 -0500
From: Benjamin Marzinski <bmarzins@redhat.com>
To: mwilck@suse.com
Message-ID: <20230323143631.GL19878@octiron.msp.redhat.com>
References: <20230320155550.7326-1-mwilck@suse.com>
MIME-Version: 1.0
In-Reply-To: <20230320155550.7326-1-mwilck@suse.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
Subject: Re: [dm-devel] [PATCH] multipath-tools Makefiles: handle dependency
 files correctly
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
Cc: dm-devel@redhat.com, Xose Vazquez Perez <xose.vazquez@gmail.com>
Errors-To: dm-devel-bounces@redhat.com
Sender: "dm-devel" <dm-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, Mar 20, 2023 at 04:55:50PM +0100, mwilck@suse.com wrote:
> From: Martin Wilck <mwilck@suse.com>
> 
> Some generated .d files were not correctly included, and not
> removed with "make dep_clean". Fix it.
> 
> Reported-by: Xose Vazquez Perez <xose.vazquez@gmail.com>
> Signed-off-by: Martin Wilck <mwilck@suse.com>

Reviewed-by: Benjamin Marzinski <bmarzins@redhat.com>

> ---
>  libmultipath/Makefile | 4 ++--
>  multipathd/Makefile   | 4 ++--
>  2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/libmultipath/Makefile b/libmultipath/Makefile
> index 61aa611..85767ab 100644
> --- a/libmultipath/Makefile
> +++ b/libmultipath/Makefile
> @@ -71,7 +71,7 @@ uninstall:
>  clean: dep_clean
>  	$(Q)$(RM) core *.a *.o *.so *.so.* *.abi nvme-ioctl.c nvme-ioctl.h autoconfig.h $(NV_VERSION_SCRIPT)
>  
> -include $(wildcard $(OBJS:.o=.d))
> +include $(wildcard $(OBJS:.o=.d) $(OBJS-T:.o=.d))
>  
>  dep_clean:
> -	$(Q)$(RM) $(OBJS:.o=.d)
> +	$(Q)$(RM) $(OBJS:.o=.d) $(OBJS-T:.o=.d)
> diff --git a/multipathd/Makefile b/multipathd/Makefile
> index 9d53132..dca8e10 100644
> --- a/multipathd/Makefile
> +++ b/multipathd/Makefile
> @@ -81,7 +81,7 @@ uninstall:
>  clean: dep_clean
>  	$(Q)$(RM) core *.o $(EXEC) $(CLI)
>  
> -include $(wildcard $(OBJS:.o=.d))
> +include $(wildcard $(OBJS:.o=.d) $(CLI_OBJS:.o=.d))
>  
>  dep_clean:
> -	$(Q)$(RM) $(OBJS:.o=.d)
> +	$(Q)$(RM) $(OBJS:.o=.d) $(CLI_OBJS:.o=.d)
> -- 
> 2.39.2
--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

