Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id E85042F823
	for <lists+dm-devel@lfdr.de>; Thu, 30 May 2019 09:56:44 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 75C99307D988;
	Thu, 30 May 2019 07:56:06 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 27932277D3;
	Thu, 30 May 2019 07:55:42 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 93B7F1806B0F;
	Thu, 30 May 2019 07:55:17 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x4TFPEMr028847 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 29 May 2019 11:25:14 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id CBB3A2B5B3; Wed, 29 May 2019 15:25:14 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx16.extmail.prod.ext.phx2.redhat.com
	[10.5.110.45])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3FEBA2AAB9;
	Wed, 29 May 2019 15:25:07 +0000 (UTC)
Received: from mail-pf1-f194.google.com (mail-pf1-f194.google.com
	[209.85.210.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id EC4D53082B71;
	Wed, 29 May 2019 15:25:01 +0000 (UTC)
Received: by mail-pf1-f194.google.com with SMTP id c6so1841056pfa.10;
	Wed, 29 May 2019 08:25:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=8fDLamalhq9zwp0W3zCZkIPwsllp49nCKwsLUyTJ3Hc=;
	b=R66SrP4CmgFcNeUP8BET9lkK2bUkt81I/nJIZDpuDb6b54j4CNcYX91lBtMdtlSLEn
	7hXaQkv8+wCEduPHFzF5QQsZBB4EvxYNDJ0Yu0slJVXcyIHDE8PdP99/skhi4t5TfZns
	UnhObnEOY9cPJ+7qZsIDoNGlz9V0C2x0RjSb5EUK5LHgq/YI1u7Hms24qhK+5zG3NluC
	qHNoUPQX33HkAf6F6bd5cTqNpxR6AFN/sFlcg7Id6tsPNSC8qXto8nW5yiqL70eYzrYi
	2sVH5EKxfNO99oP8vxU9KSki1q2W9jKAMYSnRrmuZVTaUhNPYUwFTGTDr/BnWZhk47Li
	9xjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=8fDLamalhq9zwp0W3zCZkIPwsllp49nCKwsLUyTJ3Hc=;
	b=IY/k1ywpBJLtIlkMAH4R4YL7oox2/lBGlxiV9QtL98UjhMb2NJwqaFvwgvzTy3fWnw
	80sPfvSaWs5oOnIGb1QLwb7VO6easP9caLThGc4po6E+a6f1DXDD3XmsBII+luj1L/+V
	ld/1S3XByHVaqR6qgJI3/rvquDRISZa4kfffpX/J3WICO/ScrhhDTTb/wrylvONqk/F2
	l5QjRNHtmDhN9tBKP2S3fqbePKigQ+8QVKMw7LQ0GNRWQyhzMi+nde3CoHKGgX3ETkq/
	MYFf7jGdZ2Wn4+E0QIUAcX7LnGkxl1FePMEOMvDx3pEZcy/mjzWZjx5LrlaZkcAXFekT
	QOxQ==
X-Gm-Message-State: APjAAAWb5zTicKVKWMUSvX+trz4gEGwFb0WzDTWmV3jPyyDnPWMTiS9g
	TEM3mrpfE/yUKA6Eerl2oJk=
X-Google-Smtp-Source: APXvYqyAA83krJlMy4Qvv+s+/SeDJPz5OhDu6JhT48rvqo/9btgZdD2u0/ydQebmJDOgdzcLJYI4Wg==
X-Received: by 2002:a63:6445:: with SMTP id y66mr29504576pgb.23.1559143501459; 
	Wed, 29 May 2019 08:25:01 -0700 (PDT)
Received: from zhanggen-UX430UQ ([66.42.35.75])
	by smtp.gmail.com with ESMTPSA id
	f2sm14826080pgs.83.2019.05.29.08.24.56
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 29 May 2019 08:25:00 -0700 (PDT)
Date: Wed, 29 May 2019 23:24:43 +0800
From: Gen Zhang <blackgod016574@gmail.com>
To: Bart Van Assche <bvanassche@acm.org>
Message-ID: <20190529152443.GA4076@zhanggen-UX430UQ>
References: <20190529013320.GA3307@zhanggen-UX430UQ>
	<fcf2c3c0-e479-9e74-59d5-79cd2a0bade6@acm.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <fcf2c3c0-e479-9e74-59d5-79cd2a0bade6@acm.org>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.45]);
	Wed, 29 May 2019 15:25:02 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.45]);
	Wed, 29 May 2019 15:25:02 +0000 (UTC) for IP:'209.85.210.194'
	DOMAIN:'mail-pf1-f194.google.com'
	HELO:'mail-pf1-f194.google.com' FROM:'blackgod016574@gmail.com'
	RCPT:''
X-RedHat-Spam-Score: 0.143  (DKIM_SIGNED, DKIM_VALID, DKIM_VALID_AU,
	FREEMAIL_ENVFROM_END_DIGIT, FREEMAIL_FROM, RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H3, RCVD_IN_MSPIKE_WL, SPF_HELO_NONE,
	SPF_PASS) 209.85.210.194 mail-pf1-f194.google.com 209.85.210.194
	mail-pf1-f194.google.com <blackgod016574@gmail.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.45
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Thu, 30 May 2019 03:54:08 -0400
Cc: dm-devel@redhat.com, snitzer@redhat.com, agk@redhat.com,
	linux-kernel@vger.kernel.org
Subject: Re: [dm-devel] [PATCH] dm-init: fix 2 incorrect use of kstrndup()
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: dm-devel-bounces@redhat.com
Errors-To: dm-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.48]); Thu, 30 May 2019 07:56:43 +0000 (UTC)

On Wed, May 29, 2019 at 05:23:53AM -0700, Bart Van Assche wrote:
> On 5/28/19 6:33 PM, Gen Zhang wrote:
> > In drivers/md/dm-init.c, kstrndup() is incorrectly used twice.
> > 
> > It should be: char *kstrndup(const char *s, size_t max, gfp_t gfp);
> 
> Should the following be added to this patch?
> 
> Fixes: 6bbc923dfcf5 ("dm: add support to directly boot to a mapped
> device") # v5.1.
> Cc: stable
> 
> Thanks,
> 
> Bart.
Personally, I am not quite sure about this question, because I am not 
the maintainer of this part.

Thanks
Gen

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
