Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 9979072F57B
	for <lists+dm-devel@lfdr.de>; Wed, 14 Jun 2023 09:07:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1686726438;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=rGBHIg3HkiQxc/2V25d6TtkYuFlrT3q9wjNoCoA30ZE=;
	b=HvZFO7S4Wnn/b5OMP+aKVYfY+6hkSbGlIa21MI2rMyry/2ZZslx23lbSmSgROgvq7Lt2QL
	w3jfN5ZB0O6Ba/Dw+xEke5hnH6uQnqEPe2OUM+HUbKKJSUlTR8h5rkKEbA/nxjEg4Y7DV1
	C7hnzHykA+GSatPgDT7J7T2/aJzSpyI=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-615-c6nrAO5EON-nwSWYOr-QrA-1; Wed, 14 Jun 2023 03:07:14 -0400
X-MC-Unique: c6nrAO5EON-nwSWYOr-QrA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com [10.11.54.3])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 45B0885A5B5;
	Wed, 14 Jun 2023 07:06:50 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 39E491121314;
	Wed, 14 Jun 2023 07:06:44 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 07B0119452D3;
	Wed, 14 Jun 2023 07:06:44 +0000 (UTC)
X-Original-To: dm-devel@listman.corp.redhat.com
Delivered-To: dm-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 1F885194658C
 for <dm-devel@listman.corp.redhat.com>; Tue, 13 Jun 2023 15:10:15 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 0F6592026834; Tue, 13 Jun 2023 15:10:15 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 079A72026833
 for <dm-devel@redhat.com>; Tue, 13 Jun 2023 15:10:15 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E12F4101A58B
 for <dm-devel@redhat.com>; Tue, 13 Jun 2023 15:10:14 +0000 (UTC)
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-321-5EsXyzpNO4K1ZaVNHf3WDw-1; Tue, 13 Jun 2023 11:10:06 -0400
X-MC-Unique: 5EsXyzpNO4K1ZaVNHf3WDw-1
X-IronPort-AV: E=McAfee;i="6600,9927,10740"; a="386761709"
X-IronPort-AV: E=Sophos;i="6.00,240,1681196400"; d="scan'208";a="386761709"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jun 2023 08:10:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10740"; a="801524332"
X-IronPort-AV: E=Sophos;i="6.00,240,1681196400"; d="scan'208";a="801524332"
Received: from smile.fi.intel.com ([10.237.72.54])
 by FMSMGA003.fm.intel.com with ESMTP; 13 Jun 2023 08:10:01 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1q95ei-003U22-1A; Tue, 13 Jun 2023 18:10:00 +0300
Date: Tue, 13 Jun 2023 18:10:00 +0300
From: 'Andy Shevchenko' <andriy.shevchenko@linux.intel.com>
To: David Laight <David.Laight@aculab.com>
Message-ID: <ZIiGyPMMcIxZHH9u@smile.fi.intel.com>
References: <20230612214751.9662-1-andriy.shevchenko@linux.intel.com>
 <516b13b634374885891ac1e808d37ce3@AcuMS.aculab.com>
MIME-Version: 1.0
In-Reply-To: <516b13b634374885891ac1e808d37ce3@AcuMS.aculab.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
X-Mailman-Approved-At: Wed, 14 Jun 2023 07:06:43 +0000
Subject: Re: [dm-devel] [PATCH v1 1/1] dm integrity: Use %*ph for printing
 hexdump of a small buffer
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
Cc: Heinz Mauelshagen <heinzm@redhat.com>,
 "dm-devel@redhat.com" <dm-devel@redhat.com>, Mike Snitzer <snitzer@kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Alasdair Kergon <agk@redhat.com>
Errors-To: dm-devel-bounces@redhat.com
Sender: "dm-devel" <dm-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: linux.intel.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, Jun 13, 2023 at 01:13:54PM +0000, David Laight wrote:
> From: Andy Shevchenko
> > Sent: 12 June 2023 22:48
> > 
> > The kernel already has a helper to print a hexdump of a small
> > buffer via pointer extension. Use that instead of open coded
> > variant.
> > 
> > In long term it helps to kill pr_cont() or at least narrow down
> > its use.
> > 
> > Note, the format is slightly changed, i.e. the colon is not printed
> > before the buffer dump and the trailing space is always printed.
> > These are not a problem since it's a debug message. Also the IV dump
> > is limited by 64 bytes which seems fine.
> ...
> > +#define DEBUG_bytes(bytes, len, msg, ...)	printk(KERN_DEBUG msg " %*ph\n", ##__VA_ARGS__, len,
> > bytes)
> 
> Using:
> 	printf(KERN_DEBUG msg "%s%*ph\n", ##__VA_ARGS__, len ? ": " : "", len, bytes)
> would add back the optional ':'.

Yes, I considered that and decided to avoid. This is debug and hence the format
may vary anyway. That said, up to maintainers.

-- 
With Best Regards,
Andy Shevchenko


--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

