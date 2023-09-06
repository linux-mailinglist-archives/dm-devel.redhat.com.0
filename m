Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C583794664
	for <lists+dm-devel@lfdr.de>; Thu,  7 Sep 2023 00:43:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1694040201;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=l7mzSbJQ6B9UOmEK64qFalv4/UWMcIe2xvj7z0yvcM8=;
	b=FY7rXpMHFlGObIr4lKmju2vI1yfWwCFM490wkk4V1om96gam8NyEGGKQp3B67OQiSMPi8I
	2Lzw9AtKNZi7PwAsRZJ8uoUkfEjxz0+C3piF1W1e8Rjw5QpCkhbxVOG8g7nzlVUuJr4GTq
	EUrygL91dk4r3LpXfhxNVZ+ULJLiTvM=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-653-k2NOJOKTPiaNWU1NshuHnw-1; Wed, 06 Sep 2023 18:43:18 -0400
X-MC-Unique: k2NOJOKTPiaNWU1NshuHnw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B05A88164E6;
	Wed,  6 Sep 2023 22:43:16 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 96D8A1182ED;
	Wed,  6 Sep 2023 22:43:16 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 3FA9319465B2;
	Wed,  6 Sep 2023 22:43:16 +0000 (UTC)
X-Original-To: dm-devel@listman.corp.redhat.com
Delivered-To: dm-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id D47A9194658C
 for <dm-devel@listman.corp.redhat.com>; Wed,  6 Sep 2023 22:43:15 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 9F11740C84A7; Wed,  6 Sep 2023 22:43:15 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from octiron.msp.redhat.com (octiron.msp.redhat.com [10.15.80.209])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 892B940C2070;
 Wed,  6 Sep 2023 22:43:15 +0000 (UTC)
Received: from octiron.msp.redhat.com (localhost.localdomain [127.0.0.1])
 by octiron.msp.redhat.com (8.14.9/8.14.9) with ESMTP id 386Mh7BA028924;
 Wed, 6 Sep 2023 17:43:07 -0500
Received: (from bmarzins@localhost)
 by octiron.msp.redhat.com (8.14.9/8.14.9/Submit) id 386Mh6JI028922;
 Wed, 6 Sep 2023 17:43:06 -0500
Date: Wed, 6 Sep 2023 17:43:06 -0500
From: Benjamin Marzinski <bmarzins@redhat.com>
To: mwilck@suse.com
Message-ID: <20230906224306.GP7412@octiron.msp.redhat.com>
References: <20230901180235.23980-1-mwilck@suse.com>
 <20230901180235.23980-6-mwilck@suse.com>
MIME-Version: 1.0
In-Reply-To: <20230901180235.23980-6-mwilck@suse.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
Subject: Re: [dm-devel] [PATCH 05/21] libmultipath: lookup_binding: add
 comment about the algorithm
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
Cc: dm-devel@redhat.com
Errors-To: dm-devel-bounces@redhat.com
Sender: "dm-devel" <dm-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, Sep 01, 2023 at 08:02:18PM +0200, mwilck@suse.com wrote:
> From: Martin Wilck <mwilck@suse.com>
> 
> When I read this code, I always get confused. Adding comments to
> explain the algorithm.
> 
> Signed-off-by: Martin Wilck <mwilck@suse.com>
> ---
>  libmultipath/alias.c | 35 +++++++++++++++++++++++++++++++++++
>  1 file changed, 35 insertions(+)
> 
> diff --git a/libmultipath/alias.c b/libmultipath/alias.c
> index f7834d1..e61eb91 100644
> --- a/libmultipath/alias.c
> +++ b/libmultipath/alias.c
> @@ -172,6 +172,41 @@ lookup_binding(FILE *f, const char *map_wwid, char **map_alias,
>  		alias = strtok_r(buf, " \t", &saveptr);
>  		if (!alias) /* blank line */
>  			continue;
> +
> +		/*
> +		 * Find an unused index - explanation of the algorithm
> +		 *
> +		 * ID: 1 = mpatha, 2 = mpathb, ...
> +		 *
> +		 * We assume the bindings are unsorted. The only constraint
> +		 * is that no ID occurs more than once. IDs that occur in the
> +		 * bindings are called "used".
> +		 *
> +		 * We call the list 1,2,3,..., exactly in this order, the list
> +		 * of "expected" IDs. The variable "id" always holds the next
> +		 * "expected" ID, IOW the last "expected" ID encountered plus 1.
> +		 * Thus all IDs below "id" are known to be used. However, at the
> +		 * end of the loop, the value of "id" isn't necessarily unused.
> +		 *
> +		 * "smallest_bigger_id" is the smallest used ID that was
> +		 * encountered while it was larger than the next "expected" ID
> +		 * at that iteration. Let X be some used ID. If all IDs below X
> +		 * are used and encountered in the right sequence before X, "id"
> +		 * will be > X when the loop ends. Otherwise, X was encountered
> +		 * "out of order", the condition (X > id) holds when X is
> +		 * encountered, and "smallest_bigger_id" will be set to X; i.e.
> +		 * it will be less or equal than X when the loop ends.
> +		 *
> +		 * At the end of the loop, (id < smallest_bigger_id) means that
> +		 * the value of "id" had been encountered neither in order nor
> +		 * out of order, and is thus unused. (id >= smallest_bigger_id)

I know the check is (id >= smallest_bigger_id), but as long as no ID
occurs more than once, id can never actually be bigger than
smallest_bigger_id since id only gets incremented when (curr_id == id)
and if smallest_bigger_id is not INT_MAX, then smallest_bigger_id
already occured once in the file before id was incremented to equal it.
This means it can't occur again, so id can never get incremented past
it. Not this this really matters, so

Reviewed-by: Benjamin Marzinski <bmarzins@redhat.com>

> +		 * means that "id"'s value is in use. In this case, we play safe
> +		 * and use "biggest_id + 1" as the next value to try.
> +		 *
> +		 * biggest_id is always > smallest_bigger_id, except in the
> +		 * "perfectly ordered" case.
> +		 */
> +
>  		curr_id = scan_devname(alias, prefix);
>  		if (curr_id == id) {
>  			if (id < INT_MAX)
> -- 
> 2.41.0
--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

