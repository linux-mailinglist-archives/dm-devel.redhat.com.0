Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id 5BEE325E350
	for <lists+dm-devel@lfdr.de>; Fri,  4 Sep 2020 23:31:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1599255115;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=FXxDwZcT75a2SHl9LoOHfynJ4alWAtXAIzaF+dXlUaU=;
	b=hJX6CMijJGID958ctyy0i2X0l5PIeiUt5k+pImkh7JmEzy7LNd4iJAkv8yKXhZJYC0hbrC
	DGzCyvOUcQLB6eKTsJEdm1ms8Hz88wRSS6yUbYT7oBHeJ7vAw358S/oKFrVmb/Z5y7s/Oj
	/bikXv6Kxo5D1lSVVk2GaleisFzvWA0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-134-W3UL9X8mO-a5ZPJBdE1nxA-1; Fri, 04 Sep 2020 17:31:53 -0400
X-MC-Unique: W3UL9X8mO-a5ZPJBdE1nxA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 491A3801ABC;
	Fri,  4 Sep 2020 21:31:42 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6BDF560C0F;
	Fri,  4 Sep 2020 21:31:40 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 6EBE3972EB;
	Fri,  4 Sep 2020 21:31:37 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 084LVY73024002 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 4 Sep 2020 17:31:34 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id DBCD85C22B; Fri,  4 Sep 2020 21:31:34 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from octiron.msp.redhat.com (octiron.msp.redhat.com [10.15.80.209])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id CD0BC5C1D0;
	Fri,  4 Sep 2020 21:31:31 +0000 (UTC)
Received: from octiron.msp.redhat.com (localhost.localdomain [127.0.0.1])
	by octiron.msp.redhat.com (8.14.9/8.14.9) with ESMTP id 084LVUvL025269; 
	Fri, 4 Sep 2020 16:31:30 -0500
Received: (from bmarzins@localhost)
	by octiron.msp.redhat.com (8.14.9/8.14.9/Submit) id 084LVU6P025268;
	Fri, 4 Sep 2020 16:31:30 -0500
Date: Fri, 4 Sep 2020 16:31:29 -0500
From: Benjamin Marzinski <bmarzins@redhat.com>
To: lixiaokeng <lixiaokeng@huawei.com>
Message-ID: <20200904213129.GF11108@octiron.msp.redhat.com>
References: <37544d4c-950f-4281-3b66-e4d1884c5167@huawei.com>
	<a712b9bd-fa57-b723-129d-c6d8a61c8e84@huawei.com>
MIME-Version: 1.0
In-Reply-To: <a712b9bd-fa57-b723-129d-c6d8a61c8e84@huawei.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-loop: dm-devel@redhat.com
Cc: linfeilong <linfeilong@huawei.com>,
	dm-devel mailing list <dm-devel@redhat.com>,
	Martin Wilck <mwilck@suse.com>,
	"liuzhiqiang \(I\)" <liuzhiqiang26@huawei.com>
Subject: Re: [dm-devel] [PATCH 10/14] util/tests: use assert_non_null to
 ensure malloc, returns non-null pointer
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
X-Mimecast-Spam-Score: 0.002
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Wed, Sep 02, 2020 at 03:22:37PM +0800, lixiaokeng wrote:
> In tests/util.c, we should use assert_non_null to ensure
> malloc() returns non-null pointer in both test_strlcpy_5
> and test_strlcpy_6 func.
> 
Reviewed-by: Benjamin Marzinski <bmarzins@redhat.com>
> Signed-off-by: Zhiqiang Liu <liuzhiqiang26@huawei.com>
> Signed-off-by: lixiaokeng <lixiaokeng@huawei.com>
> Signed-off-by: Linfeilong <linfeilong@huawei.com>
> ---
>  tests/util.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/tests/util.c b/tests/util.c
> index 16774dff..455eeee5 100644
> --- a/tests/util.c
> +++ b/tests/util.c
> @@ -523,6 +523,7 @@ static void test_strlcpy_5(void **state)
>  	const int sz = sizeof(src_str);
> 
>  	tst = malloc(sz);
> +	assert_non_null(tst);
>  	memset(tst, 'f', sizeof(src_str));
> 
>  	rc = strlcpy(tst, src_str, sz);
> @@ -540,6 +541,7 @@ static void test_strlcpy_6(void **state)
>  	const int sz = sizeof(src_str);
> 
>  	tst = malloc(sz + 2);
> +	assert_non_null(tst);
>  	memset(tst, 'f', sz + 2);
> 
>  	rc = strlcpy(tst, src_str, sz + 2);
> -- 

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

