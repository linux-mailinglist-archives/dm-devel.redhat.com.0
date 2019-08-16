Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id A94A890937
	for <lists+dm-devel@lfdr.de>; Fri, 16 Aug 2019 22:12:54 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id A248A793CC;
	Fri, 16 Aug 2019 20:12:50 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id ECCE32CFD1;
	Fri, 16 Aug 2019 20:12:47 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 17C7724F30;
	Fri, 16 Aug 2019 20:12:40 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x7GKCORo009358 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 16 Aug 2019 16:12:24 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 3D09984283; Fri, 16 Aug 2019 20:12:24 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from octiron.msp.redhat.com (octiron.msp.redhat.com [10.15.80.209])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9423E8429C;
	Fri, 16 Aug 2019 20:12:21 +0000 (UTC)
Received: from octiron.msp.redhat.com (localhost.localdomain [127.0.0.1])
	by octiron.msp.redhat.com (8.14.9/8.14.9) with ESMTP id x7GKCKpQ008978; 
	Fri, 16 Aug 2019 15:12:20 -0500
Received: (from bmarzins@localhost)
	by octiron.msp.redhat.com (8.14.9/8.14.9/Submit) id x7GKCINr008977;
	Fri, 16 Aug 2019 15:12:18 -0500
Date: Fri, 16 Aug 2019 15:12:18 -0500
From: Benjamin Marzinski <bmarzins@redhat.com>
To: Martin Wilck <Martin.Wilck@suse.com>
Message-ID: <20190816201218.GF25414@octiron.msp.redhat.com>
References: <20190815144638.5664-1-martin.wilck@suse.com>
	<20190815144638.5664-2-martin.wilck@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190815144638.5664-2-martin.wilck@suse.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-loop: dm-devel@redhat.com
Cc: "dm-devel@redhat.com" <dm-devel@redhat.com>
Subject: Re: [dm-devel] [PATCH 1/2] multipath.conf: add "enable_foreign"
	parameter
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.25]); Fri, 16 Aug 2019 20:12:53 +0000 (UTC)

On Thu, Aug 15, 2019 at 02:46:54PM +0000, Martin Wilck wrote:
> From: Martin Wilck <mwilck@suse.com>
> 
> This new configuration parameter can be used to selectively
> enable foreign libraries. The value is a regular expression,
> against which foreign library names such as "nvme" are matched.
> By setting this to a value that matches no foreign library
> (e.g. "^$" or "NONE"), foreign code is completely disabled.
> By default, all available foreign libraries are loaded.
> 

This will stop the foreign libraries from even claiming devices. Won't
this mean that pathinfo() will now treat these devices as multipathable
paths, since is_claimed_by_foreign() will return false? While I do see
the value in disabling foreign libraries completely, that's not the
intent of my patch.  The goal of my patch is simply to not print the
devices have been claimed by the foreign libraries.

-Ben

> Signed-off-by: Martin Wilck <mwilck@suse.com>
> ---
>  libmultipath/config.h   |  1 +
>  libmultipath/defaults.h |  2 ++
>  libmultipath/dict.c     |  6 +++++
>  libmultipath/foreign.c  | 53 +++++++++++++++++++++++++++++++++++++----
>  libmultipath/foreign.h  |  3 ++-
>  multipath/main.c        |  2 +-
>  multipathd/main.c       |  2 +-
>  7 files changed, 62 insertions(+), 7 deletions(-)
> 
> diff --git a/libmultipath/config.h b/libmultipath/config.h
> index ff2b4e86..36e99196 100644
> --- a/libmultipath/config.h
> +++ b/libmultipath/config.h
> @@ -224,6 +224,7 @@ struct config {
>  	vector elist_device;
>  	vector elist_property;
>  	vector elist_protocol;
> +	char *enable_foreign;
>  };
>  
>  extern struct udev * udev;
> diff --git a/libmultipath/defaults.h b/libmultipath/defaults.h
> index decc9335..4dfe007c 100644
> --- a/libmultipath/defaults.h
> +++ b/libmultipath/defaults.h
> @@ -48,6 +48,8 @@
>  #define DEFAULT_FIND_MULTIPATHS_TIMEOUT -10
>  #define DEFAULT_UNKNOWN_FIND_MULTIPATHS_TIMEOUT 1
>  #define DEFAULT_ALL_TG_PT ALL_TG_PT_OFF
> +/* Enable all foreign libraries by default */
> +#define DEFAULT_ENABLE_FOREIGN ""
>  
>  #define CHECKINT_UNDEF		(~0U)
>  #define DEFAULT_CHECKINT	5
> diff --git a/libmultipath/dict.c b/libmultipath/dict.c
> index c6eba0f6..9f282c3f 100644
> --- a/libmultipath/dict.c
> +++ b/libmultipath/dict.c
> @@ -610,6 +610,10 @@ declare_def_handler(find_multipaths_timeout, set_int)
>  declare_def_snprint_defint(find_multipaths_timeout, print_int,
>  			   DEFAULT_FIND_MULTIPATHS_TIMEOUT)
>  
> +declare_def_handler(enable_foreign, set_str)
> +declare_def_snprint_defstr(enable_foreign, print_str,
> +			   DEFAULT_ENABLE_FOREIGN)
> +
>  static int
>  def_config_dir_handler(struct config *conf, vector strvec)
>  {
> @@ -1710,6 +1714,8 @@ init_keywords(vector keywords)
>  	install_keyword("find_multipaths_timeout",
>  			&def_find_multipaths_timeout_handler,
>  			&snprint_def_find_multipaths_timeout);
> +	install_keyword("enable_foreign", &def_enable_foreign_handler,
> +			&snprint_def_enable_foreign);
>  	__deprecated install_keyword("default_selector", &def_selector_handler, NULL);
>  	__deprecated install_keyword("default_path_grouping_policy", &def_pgpolicy_handler, NULL);
>  	__deprecated install_keyword("default_uid_attribute", &def_uid_attribute_handler, NULL);
> diff --git a/libmultipath/foreign.c b/libmultipath/foreign.c
> index 48e8d247..4b34e141 100644
> --- a/libmultipath/foreign.c
> +++ b/libmultipath/foreign.c
> @@ -16,6 +16,7 @@
>  */
>  
>  #include <sys/sysmacros.h>
> +#include <sys/types.h>
>  #include <stdio.h>
>  #include <string.h>
>  #include <stdlib.h>
> @@ -25,6 +26,7 @@
>  #include <fnmatch.h>
>  #include <dlfcn.h>
>  #include <libudev.h>
> +#include <regex.h>
>  #include "vector.h"
>  #include "debug.h"
>  #include "util.h"
> @@ -111,17 +113,45 @@ static int select_foreign_libs(const struct dirent *di)
>  	return fnmatch(foreign_pattern, di->d_name, FNM_FILE_NAME) == 0;
>  }
>  
> -static int _init_foreign(const char *multipath_dir)
> +static void free_pre(void *arg)
> +{
> +	regex_t **pre = arg;
> +
> +	if (pre != NULL && *pre != NULL) {
> +		regfree(*pre);
> +		free(*pre);
> +		*pre = NULL;
> +	}
> +}
> +
> +static int _init_foreign(const char *multipath_dir, const char *enable)
>  {
>  	char pathbuf[PATH_MAX];
>  	struct dirent **di;
>  	struct scandir_result sr;
>  	int r, i;
> +	regex_t *enable_re = NULL;
>  
>  	foreigns = vector_alloc();
>  	if (foreigns == NULL)
>  		return -ENOMEM;
>  
> +	pthread_cleanup_push(free_pre, &enable_re);
> +	enable_re = calloc(1, sizeof(*enable_re));
> +	if (enable_re) {
> +		const char *str = enable ? enable : DEFAULT_ENABLE_FOREIGN;
> +
> +		r = regcomp(enable_re, str, REG_EXTENDED|REG_NOSUB);
> +		if (r != 0) {
> +			char errbuf[64];
> +
> +			(void)regerror(r, enable_re, errbuf, sizeof(errbuf));
> +			condlog (2, "%s: error compiling enable_foreign = \"%s\": \"%s\"",
> +				 __func__, str, errbuf);
> +			free_pre(&enable_re);
> +		}
> +	}
> +
>  	r = scandir(multipath_dir, &di, select_foreign_libs, alphasort);
>  
>  	if (r == 0) {
> @@ -163,6 +193,20 @@ static int _init_foreign(const char *multipath_dir)
>  		memset(fgn, 0, sizeof(*fgn));
>  		strlcpy((char*)fgn + offsetof(struct foreign, name), c, namesz);
>  
> +		if (enable_re != NULL) {
> +			int ret = regexec(enable_re, fgn->name, 0, NULL, 0);
> +
> +			if (ret == REG_NOMATCH) {
> +				condlog(3, "%s: foreign library \"%s\" is not enabled",
> +					__func__, fgn->name);
> +				free(fgn);
> +				continue;
> +			} else if (ret != 0)
> +				/* assume it matches */
> +				condlog(2, "%s: error %d in regexec() for %s",
> +					__func__, ret, fgn->name);
> +		}
> +
>  		snprintf(pathbuf, sizeof(pathbuf), "%s/%s", multipath_dir, fn);
>  		fgn->handle = dlopen(pathbuf, RTLD_NOW|RTLD_LOCAL);
>  		msg = dlerror();
> @@ -205,11 +249,12 @@ static int _init_foreign(const char *multipath_dir)
>  	dl_err:
>  		free_foreign(fgn);
>  	}
> -	pthread_cleanup_pop(1);
> +	pthread_cleanup_pop(1); /* free_scandir_result */
> +	pthread_cleanup_pop(1); /* free_pre */
>  	return 0;
>  }
>  
> -int init_foreign(const char *multipath_dir)
> +int init_foreign(const char *multipath_dir, const char *enable)
>  {
>  	int ret;
>  
> @@ -222,7 +267,7 @@ int init_foreign(const char *multipath_dir)
>  	}
>  
>  	pthread_cleanup_push(unlock_foreigns, NULL);
> -	ret = _init_foreign(multipath_dir);
> +	ret = _init_foreign(multipath_dir, enable);
>  	pthread_cleanup_pop(1);
>  
>  	return ret;
> diff --git a/libmultipath/foreign.h b/libmultipath/foreign.h
> index 697f12f8..acd33601 100644
> --- a/libmultipath/foreign.h
> +++ b/libmultipath/foreign.h
> @@ -195,9 +195,10 @@ struct foreign {
>   * init_foreign(dir)
>   * load and initialize foreign multipath libraries in dir (libforeign-*.so).
>   * @param dir: directory to search
> + * @param enable: regex to match foreign library name ("*" above) against
>   * @returns: 0 on success, negative value on failure.
>   */
> -int init_foreign(const char *multipath_dir);
> +int init_foreign(const char *multipath_dir, const char *enable);
>  
>  /**
>   * cleanup_foreign(dir)
> diff --git a/multipath/main.c b/multipath/main.c
> index 96a11468..4f4d8e89 100644
> --- a/multipath/main.c
> +++ b/multipath/main.c
> @@ -1050,7 +1050,7 @@ main (int argc, char *argv[])
>  		goto out;
>  	}
>  	/* Failing here is non-fatal */
> -	init_foreign(conf->multipath_dir);
> +	init_foreign(conf->multipath_dir, conf->enable_foreign);
>  	if (cmd == CMD_USABLE_PATHS) {
>  		r = check_usable_paths(conf, dev, dev_type) ?
>  			RTVL_FAIL : RTVL_OK;
> diff --git a/multipathd/main.c b/multipathd/main.c
> index 7a5cd115..b5f08617 100644
> --- a/multipathd/main.c
> +++ b/multipathd/main.c
> @@ -2848,7 +2848,7 @@ child (void * param)
>  	}
>  	/* Failing this is non-fatal */
>  
> -	init_foreign(conf->multipath_dir);
> +	init_foreign(conf->multipath_dir, conf->enable_foreign);
>  
>  	if (poll_dmevents)
>  		poll_dmevents = dmevent_poll_supported();
> -- 
> 2.22.0

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
