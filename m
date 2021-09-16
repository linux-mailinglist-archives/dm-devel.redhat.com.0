Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTP id A05F140D089
	for <lists+dm-devel@lfdr.de>; Thu, 16 Sep 2021 02:02:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1631750572;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=E5zZoaP2dyQCRABykxXHT8HxfN3iASfAhw59zsYzMpI=;
	b=LqDQik1Kk5/FhoMxFvtVwwolm5fO3qNMKysSbkojZRZjcVrj48qxVqDOgabRcVkFxQRvOs
	7S3VG6VK1VMvpSbsN48umC2UTki6HcYVEKipmauKND2E9QsFixSAAr0Hbc+nRpV5L9stoz
	WhT7CdWBHQcgQMicXzsTr7sCkpuqG/4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-31-r6c2iazmOcyZAeYQ5ZJX5g-1; Wed, 15 Sep 2021 20:02:51 -0400
X-MC-Unique: r6c2iazmOcyZAeYQ5ZJX5g-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CDBC0824FA8;
	Thu, 16 Sep 2021 00:02:45 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A8F8B10016F2;
	Thu, 16 Sep 2021 00:02:45 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 79E381809C81;
	Thu, 16 Sep 2021 00:02:44 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 18G02eWd015652 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 15 Sep 2021 20:02:40 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id D8BDF60CA0; Thu, 16 Sep 2021 00:02:40 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from octiron.msp.redhat.com (unknown [10.15.80.209])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9F3E060C82;
	Thu, 16 Sep 2021 00:02:36 +0000 (UTC)
Received: from octiron.msp.redhat.com (localhost.localdomain [127.0.0.1])
	by octiron.msp.redhat.com (8.14.9/8.14.9) with ESMTP id 18G02YFg006885; 
	Wed, 15 Sep 2021 19:02:34 -0500
Received: (from bmarzins@localhost)
	by octiron.msp.redhat.com (8.14.9/8.14.9/Submit) id 18G02XYU006884;
	Wed, 15 Sep 2021 19:02:33 -0500
Date: Wed, 15 Sep 2021 19:02:33 -0500
From: Benjamin Marzinski <bmarzins@redhat.com>
To: mwilck@suse.com
Message-ID: <20210916000233.GY3087@octiron.msp.redhat.com>
References: <20210910114120.13665-1-mwilck@suse.com>
	<20210910114120.13665-14-mwilck@suse.com>
MIME-Version: 1.0
In-Reply-To: <20210910114120.13665-14-mwilck@suse.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-loop: dm-devel@redhat.com
Cc: lixiaokeng@huawei.com, dm-devel@redhat.com,
	Chongyun Wu <wu.chongyun@h3c.com>
Subject: Re: [dm-devel] [PATCH 13/35] multipathd: cli.c: use ESRCH for
 "command not found"
X-BeenThere: dm-devel@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: device-mapper development <dm-devel.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/dm-devel>,
	<mailto:dm-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <https://listman.redhat.com/archives/dm-devel>
List-Post: <mailto:dm-devel@redhat.com>
List-Help: <mailto:dm-devel-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/dm-devel>,
	<mailto:dm-devel-request@redhat.com?subject=subscribe>
Sender: dm-devel-bounces@redhat.com
Errors-To: dm-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, Sep 10, 2021 at 01:40:58PM +0200, mwilck@suse.com wrote:
> From: Martin Wilck <mwilck@suse.com>
> 
> EAGAIN is too generic, and doesn't fit semantically either.
> ESRCH in't used anywhere else in our code.
> 
Reviewed-by: Benjamin Marzinski <bmarzins@redhat.com>
> Signed-off-by: Martin Wilck <mwilck@suse.com>
> ---
>  multipathd/cli.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/multipathd/cli.c b/multipathd/cli.c
> index 7020d2b..f8c1dbd 100644
> --- a/multipathd/cli.c
> +++ b/multipathd/cli.c
> @@ -253,7 +253,7 @@ find_key (const char * str)
>   *
>   * returns:
>   * ENOMEM: not enough memory to allocate command
> - * EAGAIN: command not found
> + * ESRCH: command not found
>   * EINVAL: argument missing for command
>   */
>  static int
> @@ -288,7 +288,7 @@ get_cmdvec (char * cmd, vector *v)
>  		}
>  		kw = find_key(buff);
>  		if (!kw) {
> -			r = EAGAIN;
> +			r = ESRCH;
>  			goto out;
>  		}
>  		cmdkw = alloc_key();
> @@ -378,7 +378,7 @@ do_genhelp(struct strbuf *reply, const char *cmd, int error) {
>  	case ENOMEM:
>  		rc = print_strbuf(reply, "%s: Not enough memory\n", cmd);
>  		break;
> -	case EAGAIN:
> +	case ESRCH:
>  		rc = print_strbuf(reply, "%s: not found\n", cmd);
>  		break;
>  	case EINVAL:
> -- 
> 2.33.0

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

