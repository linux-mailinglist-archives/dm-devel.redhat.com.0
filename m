Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id BA9356C3FF
	for <lists+dm-devel@lfdr.de>; Thu, 18 Jul 2019 03:05:32 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 57C623082B4B;
	Thu, 18 Jul 2019 01:05:28 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7214B19C78;
	Thu, 18 Jul 2019 01:05:25 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 8251041F53;
	Thu, 18 Jul 2019 01:05:11 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x6I14sOS003567 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 17 Jul 2019 21:04:54 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 901545C554; Thu, 18 Jul 2019 01:04:54 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx10.extmail.prod.ext.phx2.redhat.com
	[10.5.110.39])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 125F05C220;
	Thu, 18 Jul 2019 01:04:50 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org
	[198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id A54125945B;
	Thu, 18 Jul 2019 01:04:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
	Subject:Sender:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=yL1QRBLgiuTEBo6M7mFjYzXgwvS+vJNgmxYl0NAvUEs=;
	b=mHmwAYFl8MnzVDFln77SJazjT
	oG5816qIGlCpjSZhs/9XnQCOfSYlwVtXYOW5HMdXYm9LbZGcySnZMcwgB8bWSqJhJCXVwCtDUZsZb
	iNl4jnQcWmBPS+dsT066VquHLTdR5nKRHs9iME5jtjDoWpnlMazXXDnEEQkEi/RHfLnPY+1HGDvY2
	g1UNFh1LjyLbhELEYprPFOlU3PsIU+LLzZ9aBaavDDE3oQdrkmDXC/6QIDexd6G0U3ybh7xi3vDvF
	RLXXYYXPnZKT9p1q9XVbL4vVv5yyBIBZBBrBDya9VpZqy4ZDKz0D7qTmyDdbJzpZ3IxfMdv7wCKBI
	AG37BwH1w==;
Received: from static-50-53-52-16.bvtn.or.frontiernet.net ([50.53.52.16]
	helo=[192.168.1.17])
	by bombadil.infradead.org with esmtpsa (Exim 4.92 #3 (Red Hat Linux))
	id 1hnuql-0002QV-HP; Thu, 18 Jul 2019 01:04:47 +0000
To: Jaskaran Khurana <jaskarankhurana@linux.microsoft.com>, gmazyland@gmail.com
References: <20190718004615.16818-1-jaskarankhurana@linux.microsoft.com>
	<20190718004615.16818-2-jaskarankhurana@linux.microsoft.com>
From: Randy Dunlap <rdunlap@infradead.org>
Message-ID: <d057b88f-0a21-0843-1212-af46f67343a2@infradead.org>
Date: Wed, 17 Jul 2019 18:04:46 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <20190718004615.16818-2-jaskarankhurana@linux.microsoft.com>
Content-Language: en-US
X-Greylist: Sender passed SPF test, Sender IP whitelisted by DNSRBL, ACL 238
	matched, not delayed by milter-greylist-4.5.16 (mx1.redhat.com
	[10.5.110.39]); Thu, 18 Jul 2019 01:04:49 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.39]);
	Thu, 18 Jul 2019 01:04:49 +0000 (UTC) for IP:'198.137.202.133'
	DOMAIN:'bombadil.infradead.org' HELO:'bombadil.infradead.org'
	FROM:'rdunlap@infradead.org' RCPT:''
X-RedHat-Spam-Score: -2.398  (DKIM_SIGNED, DKIM_VALID, DKIM_VALID_AU,
	RCVD_IN_DNSWL_MED, SPF_HELO_NONE,
	SPF_NONE) 198.137.202.133 bombadil.infradead.org 198.137.202.133
	bombadil.infradead.org <rdunlap@infradead.org>
X-Scanned-By: MIMEDefang 2.78 on 10.5.110.39
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-loop: dm-devel@redhat.com
Cc: scottsh@microsoft.com, dm-devel@redhat.com, snitzer@redhat.com,
	mdsakib@microsoft.com, ebiggers@google.com,
	linux-kernel@vger.kernel.org, jmorris@namei.org,
	linux-security-module@vger.kernel.org, mpatocka@redhat.com,
	linux-fsdevel@vger.kernel.org, linux-integrity@vger.kernel.org,
	agk@redhat.com
Subject: Re: [dm-devel] [RFC PATCH v7 1/1] Add dm verity root hash pkcs7 sig
	validation.
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
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.45]); Thu, 18 Jul 2019 01:05:31 +0000 (UTC)

Hi,
Just a couple of minor nits:

On 7/17/19 5:46 PM, Jaskaran Khurana wrote:
> diff --git a/drivers/md/Kconfig b/drivers/md/Kconfig
> index 3834332f4963..c2b04d226c90 100644
> --- a/drivers/md/Kconfig
> +++ b/drivers/md/Kconfig
> @@ -490,6 +490,18 @@ config DM_VERITY
>  
>  	  If unsure, say N.
>  
> +config DM_VERITY_VERIFY_ROOTHASH_SIG
> +	def_bool n

It already defaults to n, so we usually try to omit that (don't repeat it).

> +	bool "Verity data device root hash signature verification support"
> +	depends on DM_VERITY
> +	select SYSTEM_DATA_VERIFICATION
> +	  help

"help" should only be indented by one tab (and not the extra 2 spaces).

> +	  The device mapper target created by DM-VERITY can be validated if the
> +	  pre-generated tree of cryptographic checksums passed has a pkcs#7
> +	  signature file that can validate the roothash of the tree.
> +
> +	  If unsure, say N.
> +
>  config DM_VERITY_FEC
>  	bool "Verity forward error correction support"
>  	depends on DM_VERITY


thanks.
-- 
~Randy

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
