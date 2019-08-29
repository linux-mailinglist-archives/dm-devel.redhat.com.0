Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 911ECA31EB
	for <lists+dm-devel@lfdr.de>; Fri, 30 Aug 2019 10:12:45 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id E76B53082B02;
	Fri, 30 Aug 2019 08:12:42 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id AD6565D9D3;
	Fri, 30 Aug 2019 08:12:42 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 85D441802218;
	Fri, 30 Aug 2019 08:12:41 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x7TCpvSb009834 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 29 Aug 2019 08:51:57 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 6D82460C44; Thu, 29 Aug 2019 12:51:57 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx16.extmail.prod.ext.phx2.redhat.com
	[10.5.110.45])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 67BA860CD0
	for <dm-devel@redhat.com>; Thu, 29 Aug 2019 12:51:55 +0000 (UTC)
Received: from youngberry.canonical.com (youngberry.canonical.com
	[91.189.89.112]) (using TLSv1 with cipher AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id C0AF23082B43
	for <dm-devel@redhat.com>; Thu, 29 Aug 2019 12:51:53 +0000 (UTC)
Received: from mail-pf1-f199.google.com ([209.85.210.199])
	by youngberry.canonical.com with esmtps
	(TLS1.0:RSA_AES_128_CBC_SHA1:16) (Exim 4.76)
	(envelope-from <gpiccoli@canonical.com>) id 1i3Ju4-0003sI-6S
	for dm-devel@redhat.com; Thu, 29 Aug 2019 12:51:52 +0000
Received: by mail-pf1-f199.google.com with SMTP id q67so2412485pfc.10
	for <dm-devel@redhat.com>; Thu, 29 Aug 2019 05:51:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:cc:references:to:from:openpgp:autocrypt
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=KXReb5C5sWPqimLePcMad/fib0dL8OM+ZShWXJO5G38=;
	b=WZFNTacPYO9Rw62lsb40c566q4E8WHhl9Oqq9crLIhUhglQEES6nYDusXVYiLLKpmE
	d2PttXrocIhCHZ/8vWk7mJ+5Uhll2EU5E4KFlpRbt0auMEge6Cx1+eLCTsxjR/ZQxC8q
	aBheKAkSv+JRPSqn1nTW+wwG1EoN5f0uFmryoCkDM34/zlHXAm/8FBTLlC89Evefudoz
	yaDCGeR3uoIMNqIb6MXq6Qs0cXAdNSfiXffuinD2pTJNmW7MkWIH1kT8CcTjEAL0wFX8
	DyA/5gQ6Qg/TVZqA+ghrIor9tNIXrHnKYCf6RZVK7eNXo0DPGQfpXfj6CaDpQ+7etWPK
	IlZQ==
X-Gm-Message-State: APjAAAVrka4NUwzRnr83MkeW20HBU8TdmLrb73yZ6BBEqJv7Wv3+v9P3
	ZwBROl7jcVPjeOeFzgF4gHNiwD0Wj+O6YnIThkKyVg0NC7Ubtq9Ygw4U+J7MHIiW7lNxx4qJO99
	NZ7BZ3FJfBYX5/ioaSrcbaEAaMCJTmA==
X-Received: by 2002:a62:be04:: with SMTP id l4mr8474333pff.247.1567083110987; 
	Thu, 29 Aug 2019 05:51:50 -0700 (PDT)
X-Google-Smtp-Source: APXvYqw7Y2jT58CB/26WQrcl+PZJqvLOlVtaqsnZLf+cdod1RHd8cPHHCKYYbS46eDmcnXhqa5PRKw==
X-Received: by 2002:a62:be04:: with SMTP id l4mr8474308pff.247.1567083110752; 
	Thu, 29 Aug 2019 05:51:50 -0700 (PDT)
Received: from [192.168.1.75] (200-232-247-150.dsl.telesp.net.br.
	[200.232.247.150]) by smtp.gmail.com with ESMTPSA id
	j1sm2797676pfh.174.2019.08.29.05.51.44
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 29 Aug 2019 05:51:49 -0700 (PDT)
References: <20190822161318.26236-1-gpiccoli@canonical.com>
	<20190822161318.26236-2-gpiccoli@canonical.com>
To: jes.sorensen@gmail.com
From: "Guilherme G. Piccoli" <gpiccoli@canonical.com>
Openpgp: preference=signencrypt
Autocrypt: addr=gpiccoli@canonical.com; prefer-encrypt=mutual; keydata=
	mQENBFpVBxcBCADPNKmu2iNKLepiv8+Ssx7+fVR8lrL7cvakMNFPXsXk+f0Bgq9NazNKWJIn
	Qxpa1iEWTZcLS8ikjatHMECJJqWlt2YcjU5MGbH1mZh+bT3RxrJRhxONz5e5YILyNp7jX+Vh
	30rhj3J0vdrlIhPS8/bAt5tvTb3ceWEic9mWZMsosPavsKVcLIO6iZFlzXVu2WJ9cov8eQM/
	irIgzvmFEcRyiQ4K+XUhuA0ccGwgvoJv4/GWVPJFHfMX9+dat0Ev8HQEbN/mko/bUS4Wprdv
	7HR5tP9efSLucnsVzay0O6niZ61e5c97oUa9bdqHyApkCnGgKCpg7OZqLMM9Y3EcdMIJABEB
	AAG0LUd1aWxoZXJtZSBHLiBQaWNjb2xpIDxncGljY29saUBjYW5vbmljYWwuY29tPokBNwQT
	AQgAIQUCWmClvQIbAwULCQgHAgYVCAkKCwIEFgIDAQIeAQIXgAAKCRDOR5EF9K/7Gza3B/9d
	5yczvEwvlh6ksYq+juyuElLvNwMFuyMPsvMfP38UslU8S3lf+ETukN1S8XVdeq9yscwtsRW/
	4YoUwHinJGRovqy8gFlm3SAtjfdqysgJqUJwBmOtcsHkmvFXJmPPGVoH9rMCUr9s6VDPox8f
	q2W5M7XE9YpsfchS/0fMn+DenhQpV3W6pbLtuDvH/81GKrhxO8whSEkByZbbc+mqRhUSTdN3
	iMpRL0sULKPVYbVMbQEAnfJJ1LDkPqlTikAgt3peP7AaSpGs1e3pFzSEEW1VD2jIUmmDku0D
	LmTHRl4t9KpbU/H2/OPZkrm7809QovJGRAxjLLPcYOAP7DUeltveuQENBFpVBxcBCADbxD6J
	aNw/KgiSsbx5Sv8nNqO1ObTjhDR1wJw+02Bar9DGuFvx5/qs3ArSZkl8qX0X9Vhptk8rYnkn
	pfcrtPBYLoux8zmrGPA5vRgK2ItvSc0WN31YR/6nqnMfeC4CumFa/yLl26uzHJa5RYYQ47jg
	kZPehpc7IqEQ5IKy6cCKjgAkuvM1rDP1kWQ9noVhTUFr2SYVTT/WBHqUWorjhu57/OREo+Tl
	nxI1KrnmW0DbF52tYoHLt85dK10HQrV35OEFXuz0QPSNrYJT0CZHpUprkUxrupDgkM+2F5LI
	bIcaIQ4uDMWRyHpDbczQtmTke0x41AeIND3GUc+PQ4hWGp9XABEBAAGJAR8EGAEIAAkFAlpV
	BxcCGwwACgkQzkeRBfSv+xv1wwgAj39/45O3eHN5pK0XMyiRF4ihH9p1+8JVfBoSQw7AJ6oU
	1Hoa+sZnlag/l2GTjC8dfEGNoZd3aRxqfkTrpu2TcfT6jIAsxGjnu+fUCoRNZzmjvRziw3T8
	egSPz+GbNXrTXB8g/nc9mqHPPprOiVHDSK8aGoBqkQAPZDjUtRwVx112wtaQwArT2+bDbb/Y
	Yh6gTrYoRYHo6FuQl5YsHop/fmTahpTx11IMjuh6IJQ+lvdpdfYJ6hmAZ9kiVszDF6pGFVkY
	kHWtnE2Aa5qkxnA2HoFpqFifNWn5TyvJFpyqwVhVI8XYtXyVHub/WbXLWQwSJA4OHmqU8gDl
	X18zwLgdiQ==
Message-ID: <d8185107-e517-2ce7-7f9b-aa029a97924a@canonical.com>
Date: Thu, 29 Aug 2019 09:51:38 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190822161318.26236-2-gpiccoli@canonical.com>
Content-Language: en-US
X-Greylist: Sender passed SPF test, Sender IP whitelisted by DNSRBL, ACL 238
	matched, not delayed by milter-greylist-4.5.16 (mx1.redhat.com
	[10.5.110.45]); Thu, 29 Aug 2019 12:51:54 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.45]);
	Thu, 29 Aug 2019 12:51:54 +0000 (UTC) for IP:'91.189.89.112'
	DOMAIN:'youngberry.canonical.com'
	HELO:'youngberry.canonical.com' FROM:'gpiccoli@canonical.com'
	RCPT:''
X-RedHat-Spam-Score: -4.998  (RCVD_IN_DNSWL_HI, SPF_HELO_NONE,
	SPF_NONE) 91.189.89.112 youngberry.canonical.com
	91.189.89.112 youngberry.canonical.com <gpiccoli@canonical.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.45
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Fri, 30 Aug 2019 04:12:37 -0400
Cc: linux-block@vger.kernel.org, Song Liu <songliubraving@fb.com>,
	liu.song.a23@gmail.com, NeilBrown <neilb@suse.com>,
	linux-raid@vger.kernel.org, dm-devel@redhat.com, jay.vosburgh@canonical.com
Subject: Re: [dm-devel] [PATCH v3 2/2] mdadm: Introduce new array state
 'broken' for raid0/linear
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.45]); Fri, 30 Aug 2019 08:12:43 +0000 (UTC)

On 22/08/2019 13:13, Guilherme G. Piccoli wrote:
> Currently if a md raid0/linear array gets one or more members removed while
> being mounted, kernel keeps showing state 'clean' in the 'array_state'
> sysfs attribute. Despite udev signaling the member device is gone, 'mdadm'
> cannot issue the STOP_ARRAY ioctl successfully, given the array is mounted.
> 
> Nothing else hints that something is wrong (except that the removed devices
> don't show properly in the output of mdadm 'detail' command). There is no
> other property to be checked, and if user is not performing reads/writes
> to the array, even kernel log is quiet and doesn't give a clue about the
> missing member.
> 
> This patch is the mdadm counterpart of kernel new array state 'broken'.
> The 'broken' state mimics the state 'clean' in every aspect, being useful
> only to distinguish if an array has some member missing. All necessary
> paths in mdadm were changed to deal with 'broken' state, and in case the
> tool runs in a kernel that is not updated, it'll work normally, i.e., it
> doesn't require the 'broken' state in order to work.
> Also, this patch changes the way the array state is showed in the 'detail'
> command (for raid0/linear only) - now it takes the 'array_state' sysfs
> attribute into account instead of only rely in the MD_SB_CLEAN flag.
> 
> Cc: NeilBrown <neilb@suse.com>
> Cc: Song Liu <songliubraving@fb.com>
> Signed-off-by: Guilherme G. Piccoli <gpiccoli@canonical.com>
> ---
> 
> v2 -> v3:
> * Nothing changed.
> 
> v1 -> v2:
> * Added handling for md/linear 'broken' state.
> 
> 
>  Detail.c  | 17 +++++++++++++++--
>  Monitor.c |  9 +++++++--
>  maps.c    |  1 +
>  mdadm.h   |  1 +
>  mdmon.h   |  2 +-
>  monitor.c |  4 ++--
>  6 files changed, 27 insertions(+), 7 deletions(-)
> 
> diff --git a/Detail.c b/Detail.c
> index ad60434..cc7e9f1 100644
> --- a/Detail.c
> +++ b/Detail.c
> @@ -81,6 +81,7 @@ int Detail(char *dev, struct context *c)
>  	int external;
>  	int inactive;
>  	int is_container = 0;
> +	char arrayst[12] = { 0 }; /* no state is >10 chars currently */
>  
>  	if (fd < 0) {
>  		pr_err("cannot open %s: %s\n",
> @@ -485,9 +486,21 @@ int Detail(char *dev, struct context *c)
>  			else
>  				st = ", degraded";
>  
> +			if (array.state & (1 << MD_SB_CLEAN)) {
> +				if ((array.level == 0) ||
> +				    (array.level == LEVEL_LINEAR))
> +					strncpy(arrayst,
> +						map_num(sysfs_array_states,
> +							sra->array_state),
> +						sizeof(arrayst)-1);
> +				else
> +					strncpy(arrayst, "clean",
> +						sizeof(arrayst)-1);
> +			} else
> +				strncpy(arrayst, "active", sizeof(arrayst)-1);
> +
>  			printf("             State : %s%s%s%s%s%s \n",
> -			       (array.state & (1 << MD_SB_CLEAN)) ?
> -			       "clean" : "active", st,
> +			       arrayst, st,
>  			       (!e || (e->percent < 0 &&
>  				       e->percent != RESYNC_PENDING &&
>  				       e->percent != RESYNC_DELAYED)) ?
> diff --git a/Monitor.c b/Monitor.c
> index 036103f..9fd5406 100644
> --- a/Monitor.c
> +++ b/Monitor.c
> @@ -1055,8 +1055,12 @@ int Wait(char *dev)
>  	}
>  }
>  
> +/* The state "broken" is used only for RAID0/LINEAR - it's the same as
> + * "clean", but used in case the array has one or more members missing.
> + */
> +#define CLEAN_STATES_LAST_POS	5
>  static char *clean_states[] = {
> -	"clear", "inactive", "readonly", "read-auto", "clean", NULL };
> +	"clear", "inactive", "readonly", "read-auto", "clean", "broken", NULL };
>  
>  int WaitClean(char *dev, int verbose)
>  {
> @@ -1116,7 +1120,8 @@ int WaitClean(char *dev, int verbose)
>  			rv = read(state_fd, buf, sizeof(buf));
>  			if (rv < 0)
>  				break;
> -			if (sysfs_match_word(buf, clean_states) <= 4)
> +			if (sysfs_match_word(buf, clean_states)
> +			    <= CLEAN_STATES_LAST_POS)
>  				break;
>  			rv = sysfs_wait(state_fd, &delay);
>  			if (rv < 0 && errno != EINTR)
> diff --git a/maps.c b/maps.c
> index 02a0474..49b7f2c 100644
> --- a/maps.c
> +++ b/maps.c
> @@ -150,6 +150,7 @@ mapping_t sysfs_array_states[] = {
>  	{ "read-auto", ARRAY_READ_AUTO },
>  	{ "clean", ARRAY_CLEAN },
>  	{ "write-pending", ARRAY_WRITE_PENDING },
> +	{ "broken", ARRAY_BROKEN },
>  	{ NULL, ARRAY_UNKNOWN_STATE }
>  };
>  
> diff --git a/mdadm.h b/mdadm.h
> index 43b07d5..c88ceab 100644
> --- a/mdadm.h
> +++ b/mdadm.h
> @@ -373,6 +373,7 @@ struct mdinfo {
>  		ARRAY_ACTIVE,
>  		ARRAY_WRITE_PENDING,
>  		ARRAY_ACTIVE_IDLE,
> +		ARRAY_BROKEN,
>  		ARRAY_UNKNOWN_STATE,
>  	} array_state;
>  	struct md_bb bb;
> diff --git a/mdmon.h b/mdmon.h
> index 818367c..b3d72ac 100644
> --- a/mdmon.h
> +++ b/mdmon.h
> @@ -21,7 +21,7 @@
>  extern const char Name[];
>  
>  enum array_state { clear, inactive, suspended, readonly, read_auto,
> -		   clean, active, write_pending, active_idle, bad_word};
> +		   clean, active, write_pending, active_idle, broken, bad_word};
>  
>  enum sync_action { idle, reshape, resync, recover, check, repair, bad_action };
>  
> diff --git a/monitor.c b/monitor.c
> index 81537ed..e0d3be6 100644
> --- a/monitor.c
> +++ b/monitor.c
> @@ -26,7 +26,7 @@
>  
>  static char *array_states[] = {
>  	"clear", "inactive", "suspended", "readonly", "read-auto",
> -	"clean", "active", "write-pending", "active-idle", NULL };
> +	"clean", "active", "write-pending", "active-idle", "broken", NULL };
>  static char *sync_actions[] = {
>  	"idle", "reshape", "resync", "recover", "check", "repair", NULL
>  };
> @@ -476,7 +476,7 @@ static int read_and_act(struct active_array *a, fd_set *fds)
>  		a->next_state = clean;
>  		ret |= ARRAY_DIRTY;
>  	}
> -	if (a->curr_state == clean) {
> +	if ((a->curr_state == clean) || (a->curr_state == broken)) {
>  		a->container->ss->set_array_state(a, 1);
>  	}
>  	if (a->curr_state == active ||
> 

Hi Jes, is there anything to improve in this patch? I'll submit V4 soon
to include some suggestions from Song (in the driver), so if you have
suggestions here I could add them to v4.
Thanks in advance,


Guilherme

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
