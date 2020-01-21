Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id 28EC2144119
	for <lists+dm-devel@lfdr.de>; Tue, 21 Jan 2020 16:59:05 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1579622344;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=sTxtWflW40x7yRrxANVVNUgnylWN6bHYFvgysqBs5oM=;
	b=OYYkX4XbwmM3C6YbL/F6HIZ1j9MCaEqGa50oAIB/0JxpfVVwMjzyRf6uJcj6J3bY/T0LZ7
	glFlIOk2UTH5F2Ssqp3d94szXTIamaz0QVZs3Dt8JLmKjPXiob7nNypAFXKipoS9Fx5+WK
	+ueHljJGHndbnS7AL9yiHeNUKrSbXw8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-159-F51ewj0jNw6RI0xRuVXmAQ-1; Tue, 21 Jan 2020 10:59:01 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 764F118C8C05;
	Tue, 21 Jan 2020 15:58:53 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D28DA8BE26;
	Tue, 21 Jan 2020 15:58:50 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 70A128197B;
	Tue, 21 Jan 2020 15:58:42 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 00LFwVaa027129 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 21 Jan 2020 10:58:31 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 1C7E98BE19; Tue, 21 Jan 2020 15:58:31 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from octiron.msp.redhat.com (octiron.msp.redhat.com [10.15.80.209])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8F56189E73;
	Tue, 21 Jan 2020 15:58:28 +0000 (UTC)
Received: from octiron.msp.redhat.com (localhost.localdomain [127.0.0.1])
	by octiron.msp.redhat.com (8.14.9/8.14.9) with ESMTP id 00LFwRZB018292; 
	Tue, 21 Jan 2020 09:58:27 -0600
Received: (from bmarzins@localhost)
	by octiron.msp.redhat.com (8.14.9/8.14.9/Submit) id 00LFwQnZ018291;
	Tue, 21 Jan 2020 09:58:26 -0600
Date: Tue, 21 Jan 2020 09:58:26 -0600
From: Benjamin Marzinski <bmarzins@redhat.com>
To: mwilck@suse.com
Message-ID: <20200121155826.GV30153@octiron.msp.redhat.com>
References: <20200116215514.20718-1-mwilck@suse.com>
MIME-Version: 1.0
In-Reply-To: <20200116215514.20718-1-mwilck@suse.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com
Subject: Re: [dm-devel] [PATCH] libmultipath: fix compilation with
	-fno-common
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
X-MC-Unique: F51ewj0jNw6RI0xRuVXmAQ-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Thu, Jan 16, 2020 at 10:55:14PM +0100, mwilck@suse.com wrote:
> From: Martin Wilck <mwilck@suse.com>


Reviewed-by: Benjamin Marzinski <bmarzins@redhat.com>
> 
> This never-used variable must be declared extern in order to avoid
> a link stage error with -fno-common.
> ---
>  libmultipath/structs.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/libmultipath/structs.h b/libmultipath/structs.h
> index a3adf906..4bb567d3 100644
> --- a/libmultipath/structs.h
> +++ b/libmultipath/structs.h
> @@ -106,7 +106,7 @@ enum yes_no_undef_states {
>   * _FIND_MULTIPATHS_F must have the same value as YNU_YES.
>   * Generate a compile time error if that isn't the case.
>   */
> -char ___error1___[-(_FIND_MULTIPATHS_F != YNU_YES)];
> +extern char ___error1___[-(_FIND_MULTIPATHS_F != YNU_YES)];
>  
>  #define find_multipaths_on(conf) \
>  	(!!((conf)->find_multipaths & _FIND_MULTIPATHS_F))
> -- 
> 2.24.1

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

