Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 96F4AB4789
	for <lists+dm-devel@lfdr.de>; Tue, 17 Sep 2019 08:33:29 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id D9F1385360;
	Tue, 17 Sep 2019 06:33:25 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 600335D6A9;
	Tue, 17 Sep 2019 06:33:22 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id C905F4E58A;
	Tue, 17 Sep 2019 06:33:10 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x8H6WnrY012047 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 17 Sep 2019 02:32:49 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 7C16E60BE1; Tue, 17 Sep 2019 06:32:49 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx30.extmail.prod.ext.phx2.redhat.com
	[10.5.110.71])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 138C960BFB;
	Tue, 17 Sep 2019 06:32:44 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org
	[198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 69CB21DA0;
	Tue, 17 Sep 2019 06:32:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20170209;
	h=In-Reply-To:Content-Type:MIME-Version
	:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=HjXGDV+h70RTUDpj831AKzbCg2qwAPPZgMZCO7vPWG4=;
	b=l1syoNM/9BCEX89bX+I4sjJQG
	vJOr94SID+VJXhuS1eoCBQeud7IAYFb87YxUo930JdGLiE5dF/hYfF48ANbOlTCyJwXMAlZvzMI9k
	URx4CA4OEfA/R3EHRhN1T4b0rQQb1Pipx1ANLL3xB6hNsjCToucDCez2gaxNRvVDs1CdedEsCl22s
	O7nDg3xio8ZsWElcjSXhXRxsoRkYe0zRFnqUO6v1kobt6Rmay0Fe4M9ubS4xNq9/8aurI9pH3tqVv
	hGbS4xtlLDnElvDo65qr2/fjLtNCvXpT82pwhVUKSjHMFemJkLp/zmuDx1ZO08JeW00I9xNQeHU3p
	AUv1HsE5Q==;
Received: from hch by bombadil.infradead.org with local (Exim 4.92.2 #3 (Red
	Hat Linux)) id 1iA72Y-0003E7-Qt; Tue, 17 Sep 2019 06:32:42 +0000
Date: Mon, 16 Sep 2019 23:32:42 -0700
From: Christoph Hellwig <hch@infradead.org>
To: Milan Broz <gmazyland@gmail.com>
Message-ID: <20190917063242.GA10776@infradead.org>
References: <alpine.LRH.2.02.1909160553360.11421@file01.intranet.prod.int.rdu2.redhat.com>
	<20190916180107.GA725@infradead.org>
	<127b8c4e-a6dc-6d5e-caff-fe1a0ca3a5bb@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <127b8c4e-a6dc-6d5e-caff-fe1a0ca3a5bb@gmail.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
	bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Greylist: Sender passed SPF test, Sender IP whitelisted by DNSRBL, ACL 238
	matched, not delayed by milter-greylist-4.6.2 (mx1.redhat.com
	[10.5.110.71]); Tue, 17 Sep 2019 06:32:43 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.6.2 (mx1.redhat.com [10.5.110.71]);
	Tue, 17 Sep 2019 06:32:43 +0000 (UTC) for IP:'198.137.202.133'
	DOMAIN:'bombadil.infradead.org' HELO:'bombadil.infradead.org'
	FROM:'BATV+c9b8d48512c276be374a+5868+infradead.org+hch@bombadil.srs.infradead.org'
	RCPT:''
X-RedHat-Spam-Score: -2.398  (DKIM_SIGNED, DKIM_VALID, DKIM_VALID_AU,
	RCVD_IN_DNSWL_MED, SPF_HELO_NONE,
	SPF_NONE) 198.137.202.133 bombadil.infradead.org 198.137.202.133
	bombadil.infradead.org
	<BATV+c9b8d48512c276be374a+5868+infradead.org+hch@bombadil.srs.infradead.org>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.71
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-loop: dm-devel@redhat.com
Cc: Mike Snitzer <msnitzer@redhat.com>, lvm-devel@redhat.com,
	Christoph Hellwig <hch@infradead.org>, dm-devel@redhat.com,
	Mikulas Patocka <mpatocka@redhat.com>, Zdenek Kabelac <zkabelac@redhat.com>
Subject: Re: [dm-devel] [PATCH] dm: introduce DM_GET_TARGET_VERSION
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.25]); Tue, 17 Sep 2019 06:33:28 +0000 (UTC)

On Mon, Sep 16, 2019 at 08:16:41PM +0200, Milan Broz wrote:
> 
> So the main idea behind this was just use already existing functionality
> in kernel DM, and provide simple user-friendly way to detect some incompatibilites
> more early. If detection is not there, we just fallback to the old way.

Well, and the nice way to do that is to actually report the features,
not some arbitrary version number.  That is have a sysfs file (or
ioctl for dm if that is the way to go) that reports a list of
capabilities.  Then userspace checks for that desired capability and
only tries the feture if it is supported.

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
