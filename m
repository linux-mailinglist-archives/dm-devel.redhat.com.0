Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id F1DFC454CFD
	for <lists+dm-devel@lfdr.de>; Wed, 17 Nov 2021 19:21:07 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1637173267;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=FasnvrRqb3OuxmVggxdK5lLfWrXJSEnGceDhhjmqOTw=;
	b=aYuhozLirQ0kSewnTxUdXpNbHgyci5GmYo3wWIS/74T7VCPs6HlaTV6x4doDqzB0lYhfVb
	L84sKaAhcOF5xzB6aeLAvRZfKZAJFUohsS2CFwafdwkUpBdYe7vF+4eLXs0MmE9JYQ1+WE
	S7TBefe0gdbQSahHtB1NtQWjOyocV5k=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-356-2LaczG5lN8CEUtRI0hP3_Q-1; Wed, 17 Nov 2021 13:21:03 -0500
X-MC-Unique: 2LaczG5lN8CEUtRI0hP3_Q-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DD675A40C1;
	Wed, 17 Nov 2021 18:20:56 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2C5415FC13;
	Wed, 17 Nov 2021 18:20:56 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 9BA58180BAD2;
	Wed, 17 Nov 2021 18:20:46 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 1AHIKcBn005914 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 17 Nov 2021 13:20:38 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 88BB05F4EE; Wed, 17 Nov 2021 18:20:38 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from octiron.msp.redhat.com (unknown [10.15.80.209])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E725D56A87;
	Wed, 17 Nov 2021 18:20:32 +0000 (UTC)
Received: from octiron.msp.redhat.com (localhost.localdomain [127.0.0.1])
	by octiron.msp.redhat.com (8.14.9/8.14.9) with ESMTP id 1AHIKVRD003774; 
	Wed, 17 Nov 2021 12:20:31 -0600
Received: (from bmarzins@localhost)
	by octiron.msp.redhat.com (8.14.9/8.14.9/Submit) id 1AHIKUSK003773;
	Wed, 17 Nov 2021 12:20:30 -0600
Date: Wed, 17 Nov 2021 12:20:30 -0600
From: Benjamin Marzinski <bmarzins@redhat.com>
To: mwilck@suse.com
Message-ID: <20211117182030.GZ19591@octiron.msp.redhat.com>
References: <20211112210551.12744-1-mwilck@suse.com>
	<20211112210551.12744-2-mwilck@suse.com>
MIME-Version: 1.0
In-Reply-To: <20211112210551.12744-2-mwilck@suse.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com
Subject: Re: [dm-devel] [PATCH 2/3] multipath-tools: add github workflow to
 save and check ABI
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, Nov 12, 2021 at 10:05:50PM +0100, mwilck@suse.com wrote:
> From: Martin Wilck <mwilck@suse.com>
> 
> This adds a workflow that saves the ABI of libmultipath and the
> other libraries, and optionally tests it against a known-good state,
> which is taken from the configurable ABI_BRANCH. If the ABI differs,
> the workflow fails, and the abidiff output is saved in GH actions
> as artifact "abi-test".
> 
> To configure the reference branch, set the repository secret ABI_BRANCH to the
> name of the branch that contains the ABI reference. The default is "master".
> 
> Signed-off-by: Martin Wilck <mwilck@suse.com>
Reviewed-by: Benjamin Marzinski <bmarzins@redhat.com>
> ---
>  .github/workflows/abi.yaml | 54 ++++++++++++++++++++++++++++++++++++++
>  1 file changed, 54 insertions(+)
>  create mode 100644 .github/workflows/abi.yaml
> 
> diff --git a/.github/workflows/abi.yaml b/.github/workflows/abi.yaml
> new file mode 100644
> index 0000000..53f10d4
> --- /dev/null
> +++ b/.github/workflows/abi.yaml
> @@ -0,0 +1,54 @@
> +name: check-abi
> +on:
> +  - push
> +  - pull_request
> +env:
> +  ABI_BRANCH: ${{ secrets.ABI_BRANCH }}
> +
> +jobs:
> +  save-and-test-ABI:
> +    runs-on: ubuntu-20.04
> +    steps:
> +      - name: set ABI branch
> +        if: ${{ env.ABI_BRANCH == '' }}
> +        run: echo "ABI_BRANCH=master" >> $GITHUB_ENV
> +      - name: checkout
> +        uses: actions/checkout@v2
> +      - name: get reference ABI
> +        id: reference
> +        continue-on-error: true
> +        uses: dawidd6/action-download-artifact@v2
> +        with:
> +          workflow: abi.yaml
> +          branch: ${{ env.ABI_BRANCH }}
> +          name: abi
> +          path: reference-abi
> +      - name: update
> +        run: sudo apt-get update
> +      - name: dependencies
> +        run: >
> +          sudo apt-get install --yes gcc
> +          gcc make pkg-config abigail-tools
> +          libdevmapper-dev libreadline-dev libaio-dev libsystemd-dev
> +          libudev-dev libjson-c-dev liburcu-dev libcmocka-dev
> +      - name: create ABI
> +        run: make -O -j$(grep -c ^processor /proc/cpuinfo) abi.tar.gz
> +      - name: save ABI
> +        uses: actions/upload-artifact@v1
> +        with:
> +          name: abi
> +          path: abi
> +      - name: compare ABI against reference
> +        id: compare
> +        continue-on-error: true
> +        if: ${{ steps.reference.outcome == 'success' }}
> +        run: make abi-test
> +      - name: save differences
> +        if: ${{ steps.compare.outcome == 'failure' }}
> +        uses: actions/upload-artifact@v1
> +        with:
> +          name: abi-test
> +          path: abi-test
> +      - name: fail
> +        if: ${{ steps.compare.outcome == 'failure' }}
> +        run: false
> -- 
> 2.33.1

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

