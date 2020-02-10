Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id 2804A15814F
	for <lists+dm-devel@lfdr.de>; Mon, 10 Feb 2020 18:26:18 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1581355577;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=Arp1ECnXTxEACF6u+p3I8cLQz2mk7nb2ibz+b/MXefA=;
	b=LpB/09pZ7znBL5AyL04BA8te7EkDr69AuQ9sS3FKHKhZXCL2HHMEaCAbDF7BwxioH9q2RK
	gXpLJstwJ28c5LCMASiZA8ud0SVCLpoHaXyC1fDL6rwgTLmelQgnWcv9b+Tprw9m0jzTdY
	TVkB0xEw5fa5sPCi9LMJrsILXE/G2lk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-195-BdJB0cWjPrO-UXsrXnewFw-1; Mon, 10 Feb 2020 12:26:12 -0500
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1709F190D344;
	Mon, 10 Feb 2020 17:26:07 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D2F7E89F24;
	Mon, 10 Feb 2020 17:26:06 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 0D3A81809567;
	Mon, 10 Feb 2020 17:26:06 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 01AHQ1TX028486 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 10 Feb 2020 12:26:01 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 6DBB12166B2F; Mon, 10 Feb 2020 17:26:01 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 68CC22166B2C
	for <dm-devel@redhat.com>; Mon, 10 Feb 2020 17:25:59 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id F0428185AB8C
	for <dm-devel@redhat.com>; Mon, 10 Feb 2020 17:25:58 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-135-PkPk6tuUPy2-y_lzDdQEig-1;
	Mon, 10 Feb 2020 12:25:56 -0500
Received: from relay2.suse.de (unknown [195.135.220.254])
	by mx2.suse.de (Postfix) with ESMTP id 1CD18ABEA;
	Mon, 10 Feb 2020 17:25:55 +0000 (UTC)
Message-ID: <90762c8781e576cd39de14413e41348a9eb5a7f5.camel@suse.com>
From: Martin Wilck <mwilck@suse.com>
To: Benjamin Marzinski <bmarzins@redhat.com>, Christophe Varoqui
	<christophe.varoqui@opensvc.com>
Date: Mon, 10 Feb 2020 18:27:24 +0100
In-Reply-To: <1580929100-32572-18-git-send-email-bmarzins@redhat.com>
References: <1580929100-32572-1-git-send-email-bmarzins@redhat.com>
	<1580929100-32572-18-git-send-email-bmarzins@redhat.com>
User-Agent: Evolution 3.34.3
MIME-Version: 1.0
X-MC-Unique: PkPk6tuUPy2-y_lzDdQEig-1
X-MC-Unique: BdJB0cWjPrO-UXsrXnewFw-1
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 01AHQ1TX028486
X-loop: dm-devel@redhat.com
Cc: device-mapper development <dm-devel@redhat.com>
Subject: Re: [dm-devel] [PATCH v2 17/17] tests: make directio tests able to
 work on a real device
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, 2020-02-05 at 12:58 -0600, Benjamin Marzinski wrote:
> There is now a file in tests called directio_test_dev. If the
> commented
> out test device line is uncommented and set to a device, it can be
> used
> to test the directio checker on that device, instead of faking the
> device.
> 
> Signed-off-by: Benjamin Marzinski <bmarzins@redhat.com>
> ---
>  tests/Makefile          |  16 +++++-
>  tests/directio.c        | 114
> ++++++++++++++++++++++++++++++++++++++--
>  tests/directio_test_dev |   4 ++
>  3 files changed, 130 insertions(+), 4 deletions(-)
>  create mode 100644 tests/directio_test_dev
> 
> @@ -359,6 +427,11 @@ static void test_check_state_timeout(void
> **state)
>  	will_return(__wrap_io_cancel, 0);
>  	do_check_state(&c, 1, 30, PATH_DOWN);
>  	check_aio_grp(aio_grp, 1, 0);
> +#ifdef DIO_TEST_DEV
> +	/* io_cancel will return negative value on timeout, so it
> happens again
> +	 * when freeing the checker */
> +	will_return(__wrap_io_cancel, 0);
> +#endif

I found this a bit confusing after the "will_return(__wrap_io_cancel,
0)" above. (The reader needs to realize that with DIO_TEST_DEV,
__wrap_io_cancel() discards the value passed by will_return()).

But that's just a nit.

Acked-by: Martin Wilck <mwilck@suse.com>



--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

