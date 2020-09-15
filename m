Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id 6481B26D4A4
	for <lists+dm-devel@lfdr.de>; Thu, 17 Sep 2020 09:26:04 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-205-NoUnBujXO3aDAvDyKYdfjw-1; Thu, 17 Sep 2020 03:25:52 -0400
X-MC-Unique: NoUnBujXO3aDAvDyKYdfjw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D8B9E84E241;
	Thu, 17 Sep 2020 07:25:46 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B154668874;
	Thu, 17 Sep 2020 07:25:46 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 3B73A183D041;
	Thu, 17 Sep 2020 07:25:46 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 08F97d6E029340 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 15 Sep 2020 05:07:39 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 620011102E00; Tue, 15 Sep 2020 09:07:39 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5CD471104E6E
	for <dm-devel@redhat.com>; Tue, 15 Sep 2020 09:07:37 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 00CE9800800
	for <dm-devel@redhat.com>; Tue, 15 Sep 2020 09:07:37 +0000 (UTC)
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151]) (Using TLS)
	by relay.mimecast.com with ESMTP id us-mta-156-UsUGW9gvOb6dToHnHn2E9Q-1;
	Tue, 15 Sep 2020 05:07:35 -0400
X-MC-Unique: UsUGW9gvOb6dToHnHn2E9Q-1
IronPort-SDR: WHz/tBLXFnRhNcDkolLApY5mGuufBMRRrUU68LBnNeTfzEk4gQjvjC9FNgmFBj7Eg6ytGsqFsX
	lxwU28RcgO3w==
X-IronPort-AV: E=McAfee;i="6000,8403,9744"; a="139235592"
X-IronPort-AV: E=Sophos;i="5.76,429,1592895600"; d="scan'208";a="139235592"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
	by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
	15 Sep 2020 02:06:31 -0700
IronPort-SDR: JN6muYTQqB3wm3kCXqk1xsORqKL94poqyPOQLwwV9SSOFBG1M/RLedvNq9ruyR1KSefDfAWvPJ
	brvH/uTc728w==
X-IronPort-AV: E=Sophos;i="5.76,429,1592895600"; d="scan'208";a="482690707"
Received: from emoriart-mobl.ger.corp.intel.com (HELO localhost)
	([10.252.7.208]) by orsmga005-auth.jf.intel.com with
	ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Sep 2020 02:06:16 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Joe Perches <joe@perches.com>, LKML <linux-kernel@vger.kernel.org>,
	Jiri Kosina <trivial@kernel.org>
In-Reply-To: <e6387578c75736d61b2fe70d9783d91329a97eb4.camel@perches.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <e6387578c75736d61b2fe70d9783d91329a97eb4.camel@perches.com>
Date: Tue, 15 Sep 2020 12:06:21 +0300
Message-ID: <87d02nxvci.fsf@intel.com>
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false;
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Thu, 17 Sep 2020 03:25:18 -0400
Cc: linux-fbdev@vger.kernel.org, oss-drivers@netronome.com,
	nouveau@lists.freedesktop.org, alsa-devel <alsa-devel@alsa-project.org>,
	dri-devel@lists.freedesktop.org, linux-mips@vger.kernel.org,
	linux-ide@vger.kernel.org, dm-devel@redhat.com,
	linux-mtd@lists.infradead.org, linux-i2c@vger.kernel.org,
	sparclinux@vger.kernel.org, linux-afs@lists.infradead.org,
	linux-rtc@vger.kernel.org, linux-s390@vger.kernel.org,
	linux-scsi@vger.kernel.org, dccp@vger.kernel.org,
	linux-rdma@vger.kernel.org, linux-atm-general@lists.sourceforge.net,
	kvmarm@lists.cs.columbia.edu, coreteam@netfilter.org,
	intel-wired-lan@lists.osuosl.org, linux-serial@vger.kernel.org,
	linux-input@vger.kernel.org, linux-mmc@vger.kernel.org,
	Kees Cook <kees.cook@canonical.com>, linux-media@vger.kernel.org,
	linux-pm@vger.kernel.org, intel-gfx@lists.freedesktop.org,
	linux-mediatek@lists.infradead.org,
	linux-nvme@lists.infradead.org, storagedev@microchip.com,
	ceph-devel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	Nick Desaulniers <ndesaulniers@google.com>,
	linux-nfs@vger.kernel.org, linux-parisc@vger.kernel.org,
	netdev@vger.kernel.org, linux-usb@vger.kernel.org,
	linux-wireless@vger.kernel.org, linux-sctp@vger.kernel.org,
	iommu@lists.linux-foundation.org,
	netfilter-devel@vger.kernel.org, linux-crypto@vger.kernel.org,
	bpf@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Subject: Re: [dm-devel] [Intel-gfx] [trivial PATCH] treewide: Convert
	switch/case fallthrough; to break;
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
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0.002
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, 09 Sep 2020, Joe Perches <joe@perches.com> wrote:
> diff --git a/drivers/gpu/drm/i915/display/intel_sprite.c b/drivers/gpu/drm/i915/display/intel_sprite.c
> index 5ac0dbf0e03d..35ac539cc2b1 100644
> --- a/drivers/gpu/drm/i915/display/intel_sprite.c
> +++ b/drivers/gpu/drm/i915/display/intel_sprite.c
> @@ -2861,7 +2861,7 @@ static bool gen12_plane_format_mod_supported(struct drm_plane *_plane,
>  	case I915_FORMAT_MOD_Y_TILED_GEN12_MC_CCS:
>  		if (!gen12_plane_supports_mc_ccs(dev_priv, plane->id))
>  			return false;
> -		fallthrough;
> +		break;
>  	case DRM_FORMAT_MOD_LINEAR:
>  	case I915_FORMAT_MOD_X_TILED:
>  	case I915_FORMAT_MOD_Y_TILED:

Acked-by: Jani Nikula <jani.nikula@intel.com>

for merging via whichever tree seems best.

BR,
Jani.


-- 
Jani Nikula, Intel Open Source Graphics Center

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

