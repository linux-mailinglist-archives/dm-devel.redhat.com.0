Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 414432A34BD
	for <lists+dm-devel@lfdr.de>; Mon,  2 Nov 2020 20:59:33 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1604347172;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=rE5v3w2P184M6OUC9/pDAXmqQbalTJKUiYzDv6EF6is=;
	b=BGu7LNl8knSU52A1o+6fM7CMvcKeZWaoGeXvyl+2+2ATIwFTDQoIZ93qpiTARD9UmaWfFi
	1BzbnrF2IraWSGMJVG3q/5TO716ygfS7oy/pY1e/rXwYlRKRqyuMOAcuB0HRrYR6apiyvO
	E+Hvqi27HgQ9yr97vru2EEGHxUMY5BA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-283-LQuBZpo7P1KpTIiD7xUPag-1; Mon, 02 Nov 2020 14:59:30 -0500
X-MC-Unique: LQuBZpo7P1KpTIiD7xUPag-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7B3B21007464;
	Mon,  2 Nov 2020 19:59:17 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 94B415D9DD;
	Mon,  2 Nov 2020 19:59:12 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 22CE38C7B0;
	Mon,  2 Nov 2020 19:59:01 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0A2JwmSK003229 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 2 Nov 2020 14:58:48 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 03C825B4A5; Mon,  2 Nov 2020 19:58:48 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from octiron.msp.redhat.com (octiron.msp.redhat.com [10.15.80.209])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 594C65B4A1;
	Mon,  2 Nov 2020 19:58:44 +0000 (UTC)
Received: from octiron.msp.redhat.com (localhost.localdomain [127.0.0.1])
	by octiron.msp.redhat.com (8.14.9/8.14.9) with ESMTP id 0A2Jwg8Q011453; 
	Mon, 2 Nov 2020 13:58:42 -0600
Received: (from bmarzins@localhost)
	by octiron.msp.redhat.com (8.14.9/8.14.9/Submit) id 0A2Jwdn2011452;
	Mon, 2 Nov 2020 13:58:39 -0600
Date: Mon, 2 Nov 2020 13:58:39 -0600
From: Benjamin Marzinski <bmarzins@redhat.com>
To: mwilck@suse.com
Message-ID: <20201102195839.GR3384@octiron.msp.redhat.com>
References: <20201027224536.11662-1-mwilck@suse.com>
	<20201027224536.11662-5-mwilck@suse.com>
MIME-Version: 1.0
In-Reply-To: <20201027224536.11662-5-mwilck@suse.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com, Xose Vazquez Perez <xose.vazquez@gmail.com>,
	Leonardo Arena <rnalrd@alpinelinux.org>
Subject: Re: [dm-devel] [PATCH 4/5] libmultipath tests: fix strerror()
 difference between musl and glibc
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, Oct 27, 2020 at 11:45:35PM +0100, mwilck@suse.com wrote:
> From: Martin Wilck <mwilck@suse.com>
> 
> If an error occurs with errno=0, strerror() on musl returns a different
> string than "Success". Make sure the test doesn't fail for that reason.
> 
> Signed-off-by: Martin Wilck <mwilck@suse.com>
> ---
>  tests/alias.c    | 2 +-
>  tests/test-log.c | 5 ++++-
>  2 files changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/tests/alias.c b/tests/alias.c
> index 5624138..7fda679 100644
> --- a/tests/alias.c
> +++ b/tests/alias.c
> @@ -712,7 +712,7 @@ static void al_write_err(void **state)
>  	will_return(__wrap_write, strlen(ln) - 1);
>  	expect_value(__wrap_ftruncate, length, offset);
>  	will_return(__wrap_ftruncate, 0);
> -	expect_condlog(0, "Cannot write binding to bindings file : Success\n");
> +	expect_condlog(0, "Cannot write binding to bindings file :");
>  
>  	alias = allocate_binding(0, "WWIDa", 1, "MPATH");
>  	assert_ptr_equal(alias, NULL);
> diff --git a/tests/test-log.c b/tests/test-log.c
> index 051491e..1c901cb 100644
> --- a/tests/test-log.c
> +++ b/tests/test-log.c
> @@ -2,6 +2,7 @@
>  #include <stddef.h>
>  #include <stdarg.h>
>  #include <stdio.h>
> +#include <string.h>
>  #include <cmocka.h>
>  #include "log.h"
>  #include "test-log.h"
> @@ -11,12 +12,14 @@ void __wrap_dlog (int sink, int prio, const char * fmt, ...)
>  {
>  	char buff[MAX_MSG_SIZE];
>  	va_list ap;
> +	char *expected;
>  
>  	check_expected(prio);
>  	va_start(ap, fmt);
>  	vsnprintf(buff, MAX_MSG_SIZE, fmt, ap);
>  	va_end(ap);
> -	assert_string_equal(buff, mock_ptr_type(char *));
> +	expected = mock_ptr_type(char *);
> +	assert_memory_equal(buff, expected, strlen(expected));

This looks fine. I'm just wondering the purpose. Is it just to deal with
bad, non-null terminated strings?

-Ben

>  }
>  
>  void expect_condlog(int prio, char *string)
> -- 
> 2.29.0

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

