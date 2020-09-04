Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id 6563F25E331
	for <lists+dm-devel@lfdr.de>; Fri,  4 Sep 2020 23:11:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1599253913;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=OuvCCfh+aWomGEq6y+0qan4MGTGbj+zm5evu4q4531A=;
	b=VAimilZv1jo9p8BrZ3207BxIBQfVOV5Tk4xP8VfiqhSfE60auLuCD/Evd1vQVPjnUbmOXN
	BXwSlG1K7/LreE0rOXrknH6rFvY5HPTKkyjJlwudYU7Q+xa/zFlAg8ueKEpPu3hNCY/JYu
	APs/QxOSvzkOnabfu6GER91n5muam+Q=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-496-dFff0gGJMsqFKZXpvmYWGw-1; Fri, 04 Sep 2020 17:11:50 -0400
X-MC-Unique: dFff0gGJMsqFKZXpvmYWGw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DE0111005E7F;
	Fri,  4 Sep 2020 21:11:38 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6A0161002D52;
	Fri,  4 Sep 2020 21:11:31 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 2695979DDB;
	Fri,  4 Sep 2020 21:11:22 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 084LBE28021988 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 4 Sep 2020 17:11:14 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id B4C965D9D2; Fri,  4 Sep 2020 21:11:14 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from octiron.msp.redhat.com (octiron.msp.redhat.com [10.15.80.209])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 534BA5D9CC;
	Fri,  4 Sep 2020 21:11:11 +0000 (UTC)
Received: from octiron.msp.redhat.com (localhost.localdomain [127.0.0.1])
	by octiron.msp.redhat.com (8.14.9/8.14.9) with ESMTP id 084LB95c025240; 
	Fri, 4 Sep 2020 16:11:10 -0500
Received: (from bmarzins@localhost)
	by octiron.msp.redhat.com (8.14.9/8.14.9/Submit) id 084LB9b4025239;
	Fri, 4 Sep 2020 16:11:09 -0500
Date: Fri, 4 Sep 2020 16:11:09 -0500
From: Benjamin Marzinski <bmarzins@redhat.com>
To: lixiaokeng <lixiaokeng@huawei.com>
Message-ID: <20200904211109.GD11108@octiron.msp.redhat.com>
References: <37544d4c-950f-4281-3b66-e4d1884c5167@huawei.com>
	<f8ec7113-a9da-46a0-16c8-1e245f9592f0@huawei.com>
MIME-Version: 1.0
In-Reply-To: <f8ec7113-a9da-46a0-16c8-1e245f9592f0@huawei.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-loop: dm-devel@redhat.com
Cc: linfeilong <linfeilong@huawei.com>,
	dm-devel mailing list <dm-devel@redhat.com>,
	Martin Wilck <mwilck@suse.com>,
	"liuzhiqiang \(I\)" <liuzhiqiang26@huawei.com>
Subject: Re: [dm-devel] [PATCH 08/14] libmultipath: donot free *dst if
 REALLOC fails in, merge_words
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
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0.001
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Wed, Sep 02, 2020 at 03:20:29PM +0800, lixiaokeng wrote:
> In merge_words func, if REALLOC() fails, the input *dst will
> be freed. If so, mpp->hwhandler| mpp->features|mpp->selector
> may be set to NULL after calling merge_words func in
> disassemble_map func. This may cause accessing freed memory
> problem.
> 

I'm not sure that this is the right way to fix the issue you're seeing.
If merge_words() frees mpp->hwhandler| mpp->features|mpp->selector, it
also sets them to NULL.  I don't see any place in disassemble_map()
where these would be accessed if merge_words() freed them.  Even with
this fix, there are still cases where disassemble_map() will return 1,
with these members set to NULL. If there is something that is
dereferencing them without checking if they're NULL, we should fix that.
But simply making them include partial information doesn't seem like it
fixes anything.

Am I missing something here?

-Ben

> Here, we donot free *dst if REALLOC() fails in merge_words func.
> 
> Signed-off-by: Zhiqiang Liu <liuzhiqiang26@huawei.com>
> Signed-off-by: Lixiaokeng <lixiaokeng@huawei.com>
> ---
>  libmultipath/dmparser.c | 7 +++----
>  1 file changed, 3 insertions(+), 4 deletions(-)
> 
> diff --git a/libmultipath/dmparser.c b/libmultipath/dmparser.c
> index c1031616..482e9d0e 100644
> --- a/libmultipath/dmparser.c
> +++ b/libmultipath/dmparser.c
> @@ -26,13 +26,12 @@ merge_words(char **dst, const char *word)
> 
>  	dstlen = strlen(*dst);
>  	len = dstlen + strlen(word) + 2;
> -	*dst = REALLOC(*dst, len);
> +	p = REALLOC(*dst, len);
> 
> -	if (!*dst) {
> -		free(p);
> +	if (!p)
>  		return 1;
> -	}
> 
> +	*dst = p;
>  	p = *dst + dstlen;
>  	*p = ' ';
>  	++p;
> -- 

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

