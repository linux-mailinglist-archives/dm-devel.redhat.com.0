Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id EE7F531E77A
	for <lists+dm-devel@lfdr.de>; Thu, 18 Feb 2021 09:34:19 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-178-SRgnYM_SNnax6lgYSTeoWg-1; Thu, 18 Feb 2021 03:34:16 -0500
X-MC-Unique: SRgnYM_SNnax6lgYSTeoWg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B89A680196C;
	Thu, 18 Feb 2021 08:34:09 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4BDA861F59;
	Thu, 18 Feb 2021 08:34:04 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id CDA919979;
	Thu, 18 Feb 2021 08:33:59 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 11I8WfcT017683 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 18 Feb 2021 03:32:41 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id DD4BA11902C; Thu, 18 Feb 2021 08:32:40 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D7E6C107660
	for <dm-devel@redhat.com>; Thu, 18 Feb 2021 08:32:38 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9199B81D9EA
	for <dm-devel@redhat.com>; Thu, 18 Feb 2021 08:32:38 +0000 (UTC)
Received: from verein.lst.de (verein.lst.de [213.95.11.211]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-125-ua0oZ-pXPyONMp5DY1gfVQ-1;
	Thu, 18 Feb 2021 03:32:34 -0500
X-MC-Unique: ua0oZ-pXPyONMp5DY1gfVQ-1
Received: by verein.lst.de (Postfix, from userid 2407)
	id B425D6736F; Thu, 18 Feb 2021 09:32:30 +0100 (CET)
Date: Thu, 18 Feb 2021 09:32:30 +0100
From: Christoph Hellwig <hch@lst.de>
To: Ruan Shiyang <ruansy.fnst@cn.fujitsu.com>
Message-ID: <20210218083230.GA17913@lst.de>
References: <20210208105530.3072869-1-ruansy.fnst@cn.fujitsu.com>
	<20210208105530.3072869-6-ruansy.fnst@cn.fujitsu.com>
	<20210210133347.GD30109@lst.de>
	<45a20d88-63ee-d678-ad86-6ccd8cdf7453@cn.fujitsu.com>
MIME-Version: 1.0
In-Reply-To: <45a20d88-63ee-d678-ad86-6ccd8cdf7453@cn.fujitsu.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-loop: dm-devel@redhat.com
Cc: y-goto@fujitsu.com, qi.fuli@fujitsu.com, snitzer@redhat.com,
	linux-nvdimm@lists.01.org, rgoldwyn@suse.de,
	darrick.wong@oracle.com, david@fromorbit.com,
	linux-kernel@vger.kernel.org, linux-xfs@vger.kernel.org,
	linux-mm@kvack.org, dm-devel@redhat.com,
	linux-fsdevel@vger.kernel.org, dan.j.williams@intel.com,
	Christoph Hellwig <hch@lst.de>, agk@redhat.com
Subject: Re: [dm-devel] [PATCH v3 05/11] mm,
 fsdax: Refactor memory-failure handler for dax mapping
X-BeenThere: dm-devel@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: device-mapper development <dm-devel.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/dm-devel>,
	<mailto:dm-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <https://listman.redhat.com/archives/dm-devel>
List-Post: <mailto:dm-devel@redhat.com>
List-Help: <mailto:dm-devel-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/dm-devel>,
	<mailto:dm-devel-request@redhat.com?subject=subscribe>
Sender: dm-devel-bounces@redhat.com
Errors-To: dm-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, Feb 17, 2021 at 10:56:11AM +0800, Ruan Shiyang wrote:
> I'd like to confirm one thing...  I have checked all of this patchset by 
> checkpatch.pl and it did not report the overly long line warning.  So, I 
> should still obey the rule of 80 chars one line?

checkpatch.pl is completely broken, I would not rely on it.

Here is the quote from the coding style document:

"The preferred limit on the length of a single line is 80 columns.

Statements longer than 80 columns should be broken into sensible chunks,
unless exceeding 80 columns significantly increases readability and does
not hide information."

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

