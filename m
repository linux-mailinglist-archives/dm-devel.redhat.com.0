Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id A04D72DEBE4
	for <lists+dm-devel@lfdr.de>; Sat, 19 Dec 2020 00:20:35 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1608333634;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=u8EbSKijn1xLJxfHZDYuCYsIuYhKXG+uiUy/lwPJbtQ=;
	b=QP669ouCUQKxAh8S2VDWNv7oVMP/0+RFtH7eQkKMppHxfYimcxcw21v/SiyFTgd6thH506
	l2aj0U5KOEK0eP5uU3ih4+8b1vfRS/jtHukdE7GyTqtuiWpgZHS8+PKWAz1QPB3FAr1nN0
	OTsBz91Tfwt8wrvfn6FxFu2tC4eRlW4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-405-RQKYH46MNCWZQBGUAJPRsQ-1; Fri, 18 Dec 2020 18:20:32 -0500
X-MC-Unique: RQKYH46MNCWZQBGUAJPRsQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8740559;
	Fri, 18 Dec 2020 23:20:24 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 65C1E5D9E4;
	Fri, 18 Dec 2020 23:20:24 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 2479C1809C9F;
	Fri, 18 Dec 2020 23:20:24 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0BINKLmX029568 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 18 Dec 2020 18:20:21 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 42BDB6A050; Fri, 18 Dec 2020 23:20:21 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from octiron.msp.redhat.com (octiron.msp.redhat.com [10.15.80.209])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 66DF760CE7;
	Fri, 18 Dec 2020 23:20:17 +0000 (UTC)
Received: from octiron.msp.redhat.com (localhost.localdomain [127.0.0.1])
	by octiron.msp.redhat.com (8.14.9/8.14.9) with ESMTP id 0BINKGjA010035; 
	Fri, 18 Dec 2020 17:20:16 -0600
Received: (from bmarzins@localhost)
	by octiron.msp.redhat.com (8.14.9/8.14.9/Submit) id 0BINKFhZ010034;
	Fri, 18 Dec 2020 17:20:15 -0600
Date: Fri, 18 Dec 2020 17:20:15 -0600
From: Benjamin Marzinski <bmarzins@redhat.com>
To: mwilck@suse.com
Message-ID: <20201218232015.GQ3103@octiron.msp.redhat.com>
References: <20201218222714.16209-1-mwilck@suse.com>
	<20201218222714.16209-2-mwilck@suse.com>
MIME-Version: 1.0
In-Reply-To: <20201218222714.16209-2-mwilck@suse.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com
Subject: Re: [dm-devel] [PATCH 2/2] multipath-tools unit tests: fix memory
 leaks in mpathvalid tests
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

On Fri, Dec 18, 2020 at 11:27:14PM +0100, mwilck@suse.com wrote:
> From: Martin Wilck <mwilck@suse.com>
> 
> They break "make valgrind-test".
> 
Reviewed-by: Benjamin Marzinski <bmarzins@redhat.com>
> Signed-off-by: Martin Wilck <mwilck@suse.com>
> ---
>  tests/mpathvalid.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/tests/mpathvalid.c b/tests/mpathvalid.c
> index 5ffabb9..cfe4bae 100644
> --- a/tests/mpathvalid.c
> +++ b/tests/mpathvalid.c
> @@ -381,6 +381,7 @@ static void test_mpathvalid_is_path_good2(void **state)
>  	assert_int_equal(mpathvalid_is_path(test_dev, MPATH_DEFAULT, &wwid,
>  					    wwids, 4), MPATH_IS_VALID);
>  	assert_string_equal(wwid, TEST_WWID);
> +	free(wwid);
>  }
>  
>  static void test_mpathvalid_is_path_good3(void **state)
> @@ -395,6 +396,7 @@ static void test_mpathvalid_is_path_good3(void **state)
>  	assert_int_equal(mpathvalid_is_path(test_dev, MPATH_SMART, &wwid,
>  					    wwids, 4), MPATH_IS_VALID);
>  	assert_string_equal(wwid, TEST_WWID);
> +	free(wwid);
>  }
>  
>  /* mabybe valid with no matching paths */
> @@ -410,6 +412,7 @@ static void test_mpathvalid_is_path_good4(void **state)
>  	assert_int_equal(mpathvalid_is_path(test_dev, MPATH_DEFAULT, &wwid,
>  					    wwids, 4), MPATH_IS_MAYBE_VALID);
>  	assert_string_equal(wwid, TEST_WWID);
> +	free(wwid);
>  }
>  
>  /* maybe valid with matching paths */
> @@ -425,6 +428,7 @@ static void test_mpathvalid_is_path_good5(void **state)
>  	assert_int_equal(mpathvalid_is_path(test_dev, MPATH_DEFAULT, &wwid,
>  					    wwids, 4), MPATH_IS_VALID);
>  	assert_string_equal(wwid, TEST_WWID);
> +	free(wwid);
>  }
>  
>  #define setup_test(name) \
> -- 
> 2.29.0

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

