Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 140662014BC
	for <lists+dm-devel@lfdr.de>; Fri, 19 Jun 2020 18:18:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1592583523;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=xNDRm/axFlHTiYDlPsPumJ5ls6GxC9zoxRXZukF+xX8=;
	b=FAqG2le3dvTI4IqICaXzHYAlG3EKb5k8Xovx9xHhm8wf7n1V2c1QlDYJJDcXIvncGVo4Kg
	pRV6g0AVQk+5FupZqp3NRlFJpqSEJsO5mQBSwHev4r+Q/vSdQTAndowNpFIc4gQGNyDrDh
	Xs0ihLHCXdEeWUZ4YuKW0q4cQ2/z6q4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-363-6MfaFZqmNzquno3GKVcrGA-1; Fri, 19 Jun 2020 12:18:39 -0400
X-MC-Unique: 6MfaFZqmNzquno3GKVcrGA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A0B701005513;
	Fri, 19 Jun 2020 16:18:33 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D37BD5C221;
	Fri, 19 Jun 2020 16:18:31 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id CC232833B1;
	Fri, 19 Jun 2020 16:18:25 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 05JGIHCX025192 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 19 Jun 2020 12:18:17 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id B174A7C1E5; Fri, 19 Jun 2020 16:18:17 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from localhost (unknown [10.18.25.174])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id AE7C4709D7;
	Fri, 19 Jun 2020 16:18:14 +0000 (UTC)
Date: Fri, 19 Jun 2020 12:18:14 -0400
From: Mike Snitzer <snitzer@redhat.com>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Message-ID: <20200619161813.GA24642@redhat.com>
References: <cover.1592203542.git.mchehab+huawei@kernel.org>
	<e6195a56b6e7924ccbb7fd07837453530f02e9dc.1592203542.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
In-Reply-To: <e6195a56b6e7924ccbb7fd07837453530f02e9dc.1592203542.git.mchehab+huawei@kernel.org>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com, Jonathan Corbet <corbet@lwn.net>,
	linux-kernel@vger.kernel.org, Alasdair Kergon <agk@redhat.com>,
	Linux Doc Mailing List <linux-doc@vger.kernel.org>
Subject: Re: [dm-devel] [PATCH 21/29] docs: device-mapper: add dm-ebs.rst to
 an index file
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
Content-Disposition: inline

On Mon, Jun 15 2020 at  2:47am -0400,
Mauro Carvalho Chehab <mchehab+huawei@kernel.org> wrote:

> Solves this Sphinx warning:
> 	Documentation/admin-guide/device-mapper/dm-ebs.rst: WARNING: document isn't included in any toctree
> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> ---
>  Documentation/admin-guide/device-mapper/index.rst | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/admin-guide/device-mapper/index.rst b/Documentation/admin-guide/device-mapper/index.rst
> index ec62fcc8eece..6cf8adc86fa8 100644
> --- a/Documentation/admin-guide/device-mapper/index.rst
> +++ b/Documentation/admin-guide/device-mapper/index.rst
> @@ -11,6 +11,7 @@ Device Mapper
>      dm-clone
>      dm-crypt
>      dm-dust
> +    dm-ebs
>      dm-flakey
>      dm-init
>      dm-integrity
> -- 
> 2.26.2
> 

Didn't see this fix staged in linux-next so I've picked it up for 5.8.

Thanks,
Mike

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

