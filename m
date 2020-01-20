Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 6BFF3142571
	for <lists+dm-devel@lfdr.de>; Mon, 20 Jan 2020 09:26:39 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1579508798;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=aWw/Tm8ZsvCjad35u49I1PAyoKPDdNUjcmUFclhity8=;
	b=HUCnmWuW9NYxEpvZUgk6od/2op8AljrNnGMJtN/zn00YRm/YgBM1xHiUqsuPaV34QS7ikJ
	V+nl8aK2B6o6waEcsR4VwhKPQ4Wg7/zz9gdRqDL2qY1iY+GEQ/eV/o1FisLvUnSMKTokoU
	ZBk7Np4TcTZzfzEXXjGahdUD8By5klw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-345-vXUvUN1DMmaY12FNJJZ8rg-1; Mon, 20 Jan 2020 03:26:36 -0500
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7C8E11084439;
	Mon, 20 Jan 2020 08:26:29 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0BBC35C28F;
	Mon, 20 Jan 2020 08:26:28 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 40A9218089CD;
	Mon, 20 Jan 2020 08:26:23 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 00K8QEkB028315 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 20 Jan 2020 03:26:14 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 170F92166B2C; Mon, 20 Jan 2020 08:26:14 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1316C2166B2A
	for <dm-devel@redhat.com>; Mon, 20 Jan 2020 08:26:12 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1C8CA800FEA
	for <dm-devel@redhat.com>; Mon, 20 Jan 2020 08:26:12 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-175-4FKgVptdN3CNTik67gniCA-1;
	Mon, 20 Jan 2020 03:26:09 -0500
Received: from relay2.suse.de (unknown [195.135.220.254])
	by mx2.suse.de (Postfix) with ESMTP id 53673AD3E;
	Mon, 20 Jan 2020 08:26:08 +0000 (UTC)
Message-ID: <e45a8a4058b97970412455f835c00e1982d8a5d0.camel@suse.de>
From: Martin Wilck <mwilck@suse.com>
To: Benjamin Marzinski <bmarzins@redhat.com>, Christophe Varoqui
	<christophe.varoqui@opensvc.com>
Date: Mon, 20 Jan 2020 09:27:25 +0100
In-Reply-To: <1579227500-17196-16-git-send-email-bmarzins@redhat.com>
References: <1579227500-17196-1-git-send-email-bmarzins@redhat.com>
	<1579227500-17196-16-git-send-email-bmarzins@redhat.com>
User-Agent: Evolution 3.34.3
MIME-Version: 1.0
X-MC-Unique: 4FKgVptdN3CNTik67gniCA-1
X-MC-Unique: vXUvUN1DMmaY12FNJJZ8rg-1
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 00K8QEkB028315
X-loop: dm-devel@redhat.com
Cc: device-mapper development <dm-devel@redhat.com>
Subject: Re: [dm-devel] [PATCH 15/15] tests: add directio unit tests
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, 2020-01-16 at 20:18 -0600, Benjamin Marzinski wrote:
> Signed-off-by: Benjamin Marzinski <bmarzins@redhat.com>
> ---
>  tests/Makefile   |   3 +-
>  tests/directio.c | 704
> +++++++++++++++++++++++++++++++++++++++++++++++
>  2 files changed, 706 insertions(+), 1 deletion(-)
>  create mode 100644 tests/directio.c
> 
> diff --git a/tests/Makefile b/tests/Makefile
> index a5cdf390..275fdd7d 100644
> +
> +/* test async checkers pending and getting resovled by another
> checker
> + * as well as the loops for getting multiple events */
> +static void test_check_state_async(void **state)
> +{
> +	int i;
> +	struct checker c[257] = {0};
> +	struct async_req *reqs[257];
> +	int res[257] = {0};
> +
> +	do_libcheck_load();
> +	for (i = 0; i < 257; i++)
> +		do_libcheck_init(&c[i], 4096, &reqs[i]);
> +	for (i = 0; i < 256; i++) {
> +		return_io_getevents_none();
> +		do_check_state(&c[i], 0, 30, PATH_PENDING);
> +		assert_true(is_checker_running(&c[i]));
> +	}
> +	return_io_getevents_nr(&full_timeout, 256, reqs, res);
> +	return_io_getevents_nr(NULL, 1, &reqs[256], &res[256]);
> +	do_check_state(&c[256], 0, 30, PATH_UP);
> +	assert_false(is_checker_running(&c[256]));
> +	libcheck_free(&c[i]);

Writing &c[256] here would be better readable. Apart from that, this is
looking good. Some of the tests are implementation-specific, but that's
fine if we stick with this implementation.

I wish we could have some tests with real aio for this, but that would
be difficult to set up right. Perhaps scsi_debug could be leveraged for
it.

Regards
Martin




--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

