Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 09B5816AB0
	for <lists+dm-devel@lfdr.de>; Tue,  7 May 2019 20:52:38 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 7CE743082132;
	Tue,  7 May 2019 18:52:35 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4D56B1001DD8;
	Tue,  7 May 2019 18:52:35 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id B1A5141F3C;
	Tue,  7 May 2019 18:52:32 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x47IpvBI001102 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 7 May 2019 14:51:57 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 8E1B43AA8; Tue,  7 May 2019 18:51:57 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from localhost (unknown [10.18.25.174])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 43FE219729;
	Tue,  7 May 2019 18:51:55 +0000 (UTC)
Date: Tue, 7 May 2019 14:51:54 -0400
From: Mike Snitzer <snitzer@redhat.com>
To: Mikulas Patocka <mpatocka@redhat.com>
Message-ID: <20190507185154.GB24320@redhat.com>
References: <20190429125746.036036640@debian-a64.vm>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190429125746.036036640@debian-a64.vm>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-loop: dm-devel@redhat.com
Cc: Ondrej Kozina <okozina@redhat.com>, Heinz Mauelshagen <heinzm@redhat.com>,
	dm-devel@redhat.com, Alasdair G Kergon <agk@redhat.com>,
	Milan Broz <mbroz@redhat.com>
Subject: Re: [dm-devel] [PATCH 08/10] dm-integrity: add a bitmap mode
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.42]); Tue, 07 May 2019 18:52:36 +0000 (UTC)

On Mon, Apr 29 2019 at  8:57am -0400,
Mikulas Patocka <mpatocka@redhat.com> wrote:

> Add a new bitmap mode for dm-integrity.
> 
> Signed-off-by: Mikulas Patocka <mpatocka@redhat.com>

This patch header needs much more detail.

Can you please be as informative and detailed as possible about what
this new bitmap mode is (what constraints it has, where it is expected
to be useful, etc)?  Also, if you have them, provide some benchmarks
that showcase its benefits.

Thanks,
Mike

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
