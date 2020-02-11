Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id 18027158B6B
	for <lists+dm-devel@lfdr.de>; Tue, 11 Feb 2020 09:44:26 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1581410665;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=Sdg+dn6/lDdb1FAY7M7Sj4/Yoir0+7st7L6eNLUbTn0=;
	b=XOJi9JH61cXnWBZit2RhsvVs6E27kni9o3ZwDpi6S2F0YscyOl+ddSfTLd3hlyXRRkM+fY
	PxXYVDNEYvrhbe5obT7+/BPO4foNZA/UCJiOKw1m+cMVUlHX++1pTFU3FSiO+tL7N+Ke2A
	D+meFErSVCR6NQVfUDCPsPXcBYtKTvo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-36-UhhLizFlPUGEhzOSphz3pg-1; Tue, 11 Feb 2020 03:44:22 -0500
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 752DE100551C;
	Tue, 11 Feb 2020 08:44:17 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3A24F26FB9;
	Tue, 11 Feb 2020 08:44:17 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 120341803C33;
	Tue, 11 Feb 2020 08:44:16 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 01B8iBEG008871 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 11 Feb 2020 03:44:11 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 050E52166B2A; Tue, 11 Feb 2020 08:44:11 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 012112166B27
	for <dm-devel@redhat.com>; Tue, 11 Feb 2020 08:44:08 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D726680206B
	for <dm-devel@redhat.com>; Tue, 11 Feb 2020 08:44:08 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-261-8Y_NshNpNoOBw0CqUCWe9Q-1;
	Tue, 11 Feb 2020 03:44:06 -0500
Received: from relay2.suse.de (unknown [195.135.220.254])
	by mx2.suse.de (Postfix) with ESMTP id 57215B1CC;
	Tue, 11 Feb 2020 08:44:05 +0000 (UTC)
Message-ID: <f031e9fa9fdc4be08ee76a2d65ea2c99f8cf0fb3.camel@suse.com>
From: Martin Wilck <mwilck@suse.com>
To: Benjamin Marzinski <bmarzins@redhat.com>, Christophe Varoqui
	<christophe.varoqui@opensvc.com>
Date: Tue, 11 Feb 2020 09:45:34 +0100
In-Reply-To: <1580929100-32572-1-git-send-email-bmarzins@redhat.com>
References: <1580929100-32572-1-git-send-email-bmarzins@redhat.com>
User-Agent: Evolution 3.34.3
MIME-Version: 1.0
X-MC-Unique: 8Y_NshNpNoOBw0CqUCWe9Q-1
X-MC-Unique: UhhLizFlPUGEhzOSphz3pg-1
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 01B8iBEG008871
X-loop: dm-devel@redhat.com
Cc: device-mapper development <dm-devel@redhat.com>
Subject: Re: [dm-devel] [PATCH v2 00/17] Multipath patch dump
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi Christophe,

On Wed, 2020-02-05 at 12:58 -0600, Benjamin Marzinski wrote:
> This patch set is has multiple parts.
> 
> patch 01 is just a resubmit of my previous patch, with Martin's
> corrections added.
> 
> Patches 02 - 07 are miscellaneous fixes and cleanups
> 
> Patches 08 - 10 are related to adding a new format wildcard, at the
> 	request of HPE, that allows multipath to get and display
> 	information from the vendor specific VPD pages
> 
> Patches 11 - 17 are the part that needs the most review, patch 14
> 	especially. It turns out that on machines with a large number
> 	of cores, io_destroy(), which is used by the directio checker,
> 	can take a long time to complete. Talking to some kernel people
> 	at Red Hat, I was told that this isn't a bug. It's working as
> 	expected, and multipath shouldn't be issuing so many
> 	io_destroy() calls (1 per path, when multipath or multipathd
> 	stops). Cutting out the io_destroy calls involved a major
> change
> 	to the directio checker. It's pretty hard to test a lot of the
> 	corner cases on actual hardware, so I've written a bunch of
> 	unit tests for this (patches 16 & 17).
> 
> Changes is v2:
> 0001-multipathd-warn-when-configuration-has-been-changed.patch
> 	Minor changes, including using a structure instead of an
> 	array to hold the watch descriptors, as suggested by Martin
> 	Wilck.
> 
> 0002-multipathd-staticify-uxlsnr-variables-functions.patch
> 	New patch
> 
> 0008-libmultipath-fix-sgio_get_vpd-looping.patch
> 	Test has been changed to keep create_vpd83 the same, and
> 	overwrite the length in the actual test, as suggested by
> 	Martin Wilck
> 
> 0010-libmultipath-add-code-to-get-vendor-specific-vpd-dat.patch
> 	The information to find the vpd page and how to decode it is
> 	now simply the index in a table of name -> page_nr mappings
> 
> 0012-libmultipath-change-failed-path-prio-timeout.patch
> 	The timeout argument has been renamed to avoid confusion,
> 	as suggested by Martin Wilck
> 
> 0015-libmultipath-make-directio-checker-share-io-contexts.patch
> 	Minor changes to print more useful messages, and avoid
> 	printing anything when we get a non-zero io_cancel()
> 	result, as suggested by Martin Wilck
> 
> 0016-tests-add-directio-unit-tests.patch
> 	Minor change to improve readability, as suggested by
> 	Martin Wilck
> 
> 0017-tests-make-directio-tests-able-to-work-on-a-real-dev.patch
> 	New patch. This adds the ability to set a testing device, so
> 	you can run the directio tests on an actual device
> 
> Benjamin Marzinski (17):
>   multipathd: warn when configuration has been changed.
>   multipathd: staticify uxlsnr variables/functions
>   libmultipath: fix leak in foreign code
>   Fix leak in mpathpersist
>   libmultipath: remove unused path->prio_args
>   libmultipath: constify get_unaligned_be*
>   libmultipath: add missing hwe mpe variable merges
>   libmultipath: fix sgio_get_vpd looping
>   libmultipath: add vend_id to get_vpd_sgio
>   libmultipath: add code to get vendor specific vpd data
>   libmultipath: change how the checker async is set
>   libmultipath: change failed path prio timeout
>   multipathd: add new paths under vecs lock
>   libmultipath: add new checker class functions
>   libmultipath: make directio checker share io contexts
>   tests: add directio unit tests
>   tests: make directio tests able to work on a real device
> 
>  libmpathpersist/mpath_persist.c  |   2 +-
>  libmultipath/checkers.c          |  29 +-
>  libmultipath/checkers.h          |   1 +
>  libmultipath/checkers/directio.c | 336 ++++++++++---
>  libmultipath/config.c            |  10 +
>  libmultipath/config.h            |   2 +
>  libmultipath/dict.c              |  38 ++
>  libmultipath/discovery.c         |  80 ++-
>  libmultipath/discovery.h         |   2 +-
>  libmultipath/foreign.c           |  11 +-
>  libmultipath/hwtable.c           |   1 +
>  libmultipath/print.c             |  25 +
>  libmultipath/prio.c              |   6 +-
>  libmultipath/propsel.c           |  20 +-
>  libmultipath/propsel.h           |   1 +
>  libmultipath/structs.h           |  16 +-
>  libmultipath/unaligned.h         |   4 +-
>  mpathpersist/main.c              |   1 +
>  multipath/main.c                 |   1 +
>  multipath/multipath.conf.5       |  15 +-
>  multipathd/main.c                |  18 +-
>  multipathd/uxlsnr.c              | 150 +++++-
>  tests/Makefile                   |  19 +-
>  tests/directio.c                 | 812
> +++++++++++++++++++++++++++++++
>  tests/directio_test_dev          |   4 +
>  tests/vpd.c                      |  87 ++--
>  26 files changed, 1534 insertions(+), 157 deletions(-)
>  create mode 100644 tests/directio.c
>  create mode 100644 tests/directio_test_dev
> 

ACK for the series: Martin Wilck <mwilck@suse.com>

Ben and I agreed that he'll follow up with some minor fixes, but
there's no reason to hold this back.



--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

