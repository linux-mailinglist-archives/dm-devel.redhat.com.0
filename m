Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id BBFC52DEBE3
	for <lists+dm-devel@lfdr.de>; Sat, 19 Dec 2020 00:20:10 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1608333609;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=Zxn8/HmCqrlaOABdtIB/ZWtd/9j1HH8jDedZKlgtPPw=;
	b=E4MRQgV/GaNwAfWMIwyOANe0URGG9lNhLkpftJA3UfT/iEyG9wG2/2DitJ8cP7IDl6JxJ7
	N3+t9wgKrLaAoHOIutusLJyhpSwzCXz0T2yb3YcbH0nnDEZsczDisH/+MuT0dE18Bt1y9m
	fO9tG4W37q/1hG0jUuVGSgLIIm7Bf2I=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-519-BSE88uVHPA-T7UAk9Ws-ow-1; Fri, 18 Dec 2020 18:20:06 -0500
X-MC-Unique: BSE88uVHPA-T7UAk9Ws-ow-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 350C6802B47;
	Fri, 18 Dec 2020 23:20:00 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 123E260C47;
	Fri, 18 Dec 2020 23:20:00 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 397011809C9F;
	Fri, 18 Dec 2020 23:19:59 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0BINJtRr029512 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 18 Dec 2020 18:19:55 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id D5637299A1; Fri, 18 Dec 2020 23:19:55 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from octiron.msp.redhat.com (octiron.msp.redhat.com [10.15.80.209])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 76AD52999F;
	Fri, 18 Dec 2020 23:19:52 +0000 (UTC)
Received: from octiron.msp.redhat.com (localhost.localdomain [127.0.0.1])
	by octiron.msp.redhat.com (8.14.9/8.14.9) with ESMTP id 0BINJpQ4010029; 
	Fri, 18 Dec 2020 17:19:51 -0600
Received: (from bmarzins@localhost)
	by octiron.msp.redhat.com (8.14.9/8.14.9/Submit) id 0BINJoJG010028;
	Fri, 18 Dec 2020 17:19:50 -0600
Date: Fri, 18 Dec 2020 17:19:50 -0600
From: Benjamin Marzinski <bmarzins@redhat.com>
To: mwilck@suse.com
Message-ID: <20201218231950.GP3103@octiron.msp.redhat.com>
References: <20201218222714.16209-1-mwilck@suse.com>
MIME-Version: 1.0
In-Reply-To: <20201218222714.16209-1-mwilck@suse.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com
Subject: Re: [dm-devel] [PATCH 1/2] multipath-tools tests: unversioned .so
 for valgrind tests
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, Dec 18, 2020 at 11:27:13PM +0100, mwilck@suse.com wrote:
> From: Martin Wilck <mwilck@suse.com>
> 
> We need to the same thing for valgrind tests as we did in
> 448752f ("libmultipath: create separate .so for unit tests").
> 
Reviewed-by: Benjamin Marzinski <bmarzins@redhat.com>
> Signed-off-by: Martin Wilck <mwilck@suse.com>
> ---
>  tests/Makefile | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/tests/Makefile b/tests/Makefile
> index 54da774..50673fa 100644
> --- a/tests/Makefile
> +++ b/tests/Makefile
> @@ -76,7 +76,7 @@ lib/libchecktur.so:
>  
>  %.vgr:  %-test lib/libchecktur.so
>  	@echo == running valgrind for $< ==
> -	@LD_LIBRARY_PATH=$(multipathdir):$(mpathcmddir) \
> +	@LD_LIBRARY_PATH=.:$(mpathcmddir) \
>  		valgrind --leak-check=full --error-exitcode=128 ./$< >$@ 2>&1
>  
>  OBJS = $(TESTS:%=%.o) $(HELPERS)
> -- 
> 2.29.0

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

